package Pickie::Container;

use Pickie::Tools;
use Dancer::Plugin::DBIC;
use Dancer ':syntax';


use strict;
use warnings;

my $tools = Pickie::Tools->new;




sub new {
    my $class = shift;
    my $self = bless {}, $class;
    return $self;
}

sub has_access {
    my ($self,$container_id) = @_;
    my $user_id = session('user_id');
    

	my $count = schema->resultset('PermissionsView')->search({
		user_id => $user_id,
		container_id  => $container_id,
	})->count;
    
    return 1 if $count == 1;
    return 0 if $count != 1;

}

sub get_objects {
	my ($self,$container_id) = @_;
	
	my @objects;
	my $search = schema->resultset('ContainerObjects')->search({
			container_id => $container_id
	});
	while (my $row = $search->next) {
		my $hash = {
			object_id => $row->object_id,
			container_id => $row->container_id,
			object_name => $row->object_name,
			date_created => $row->date_created,
			date_modified => $row->date_modified,
			modified_by => $row->modified_by,
			keep_history => $row->keep_history,
		};
		push (@objects,$hash);
	}
	
	return \@objects;
}

sub get_object {
	my ($self,$object_id) = @_;
	
	my $search = schema->resultset('ContainerObjects')->find($object_id);
	
	my $container_id = $search->container_id;
	
	if ($self->has_access($container_id)) {
		
		my $container = $self->get_container($container_id);
		
		my $key  = $tools->get_container_key($container_id);
		
		my $decrypted_data = $tools->decrypt($key,$search->object_value);
		
		my $hash = {
			decrypted_data => $decrypted_data,
			container_id => $container_id,
			object_name => $search->object_name,
			object_id => $object_id,
			container_name => $container->{'container_name'}
		};
		
		return $hash;
				
	}
	
}

sub get_container {
	my ($self,$container_id) = @_;
	my $search = schema->resultset('Containers')->find($container_id);
	my $hash = {
		container_id => $container_id,
		container_name => $search->container_name,
		date_created => $search->date_created,
		date_modified => $search->date_modified,
		modified_by  => $search->modified_by,
	};
	return $hash;
}
sub get_container_from_object_id {
	my ($self,$object_id) = @_;
	my $search = schema->resultset('ContainerObjects')->find($object_id)->container_id;
	my $hash = $self->get_container($search);
	return $hash;
}
sub get_containers {
    my ($self) = shift;
    my $user_id = session('user_id');
    my @containers;
    my $search = schema->resultset('PermissionsView')->search({ user_id => $user_id });
	if ($search->count >  0) {
		while (my $row = $search->next) {
			my $hash = {
				container_id => $row->container_id,
				container_name => $row->container_name,
			};
			push (@containers,$hash);
		}
	
	}
    return \@containers;
}

sub add {
    my $name = param 'name';
    
    
    if ($name =~ /.{1,50}$/) {
        my $key_password = session('key_password');
        my $user_id = session('user_id');
    
        my $container_key = $tools->generate_key;
    
        my $encrypted_container_key = $tools->encrypt($key_password,$container_key);
        
        my $insert = schema->resultset('Containers')->create({
            container_name => $name,
            date_created => time,
            date_modified => time,
            modified_by => $user_id,
        });
        if ($insert->id) {
            my $hash = {
                id => $insert->id,
                name => $name,
				key => $container_key,
            };
            my $update = schema->resultset('DecryptKeys')->search({ container_id => $insert->id })->update( { decrypt_key => $encrypted_container_key });
            return $hash;
        }
        else {
            return 0;
        }
    }
    else {
        return 0;
    }
}

sub newobject {
	my $self = shift;
	my ($container_id) = splat;
	if ($self->has_access($container_id)) {
		
		my $name = param 'name';
		my $data = param 'data';
		my $key  = $tools->get_container_key($container_id);
		
		my $encrypted_data = $tools->encrypt($key,$data);
		
		my $insert = schema->resultset('ContainerObjects')->create({
			container_id => $container_id,
			object_name  => $name,
			object_value => $encrypted_data,
			date_created => time,
			date_modified => time,
			modified_by => session('user_id'),
			keep_history => 0,
		});
		if ($insert->id) {
			my $hash = {
				id => $insert->id,
				name => $name,
			};
			return $hash;
		}
		else { return 0; }
		
		
	}
	else {
		return 0;
	}
}
sub edit_object {
	my $self = shift;
	my ($object_id) = splat;
	my $object = $self->get_object($object_id);
	
	my $container_id = $object->{'container_id'};
	if ($self->has_access($container_id)) {
		
		
		
		my $name = param 'name';
		my $data = param 'data';
		
		my $key  = $tools->get_container_key($container_id);
		
		my $encrypted_data = $tools->encrypt($key,$data);
		
		my $update = schema->resultset('ContainerObjects')->find($object_id);
		
		my $new = {
			object_name => $name,
			object_value => $encrypted_data,
			date_modified => time,
			modified_by => session('user_id'),
		};
		if ($update->update($new)) {
			
			my $object = $self->get_object($object_id);
			return $object;
		}
		
		
	}
	
}


1;



