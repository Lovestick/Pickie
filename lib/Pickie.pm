package Pickie;
use Dancer ':syntax';
use Dancer::Plugin::DBIC;
use Dancer::Plugin::Captcha::SecurityImage;
use Crypt::PasswdMD5;
use Database::Main;


use Pickie::Container;
my $container = Pickie::Container->new;
our $VERSION = '0.1';



hook 'before' => sub {
    if (!session('authenticated') && request->path_info !~ m{^/(login|captcha)}) {
        request->path_info('/login');
    }
};
hook 'before' => sub {
	if ( (session('authenticated') && !session('key_password')) && request->path_info !~ m{^/(unlock|logout)}) {
		request->path_info('/');
	}
};



get '/captcha' => sub {
    create_captcha {
        new => {
            width    => 100,
            height   => 35,
            angle    => 6,
            lines    => 3,
            ptsize => 20,
            font => 'fonts/DejaVuSerif.ttf',
        },
        create     => [ ttf => 'box', '#80C0F0', '#0F644B' ],
        particle   => [ 10 ],
        out        => { force => 'jpeg' },
        random     => 12345,
    };
};

get '/login' => sub {
    template 'login.tt';
};
post '/login' => sub {
    my $username = param 'username';
    my $password = param 'password';
    my $captcha  = param 'captcha';
    
    my @errors;
    if (validate_captcha $captcha) {
    
        my $search = schema->resultset('Users')->search({
        	username => $username
    	});
    	my $row    = $search->first;
    	my $stored = $row->login_password;
		

        if ($stored eq unix_md5_crypt($password,$stored)) {
            session authenticated => 1;
            session username      => $username;
            session user_id       => $row->user_id;
            session wiki    => $container->get_containers;
            redirect '/';
        }
        else {
            push (@errors, "Invalid username or password");
                       
        }
    }
    else {
        push (@errors, "Security Image");
        
    }
    var errors => \@errors;
    template 'login.tt';

};
post '/unlock' => sub {
	my $key_password = param 'key_password';
	my $user_id      = session 'user_id';
	
    my $stored = schema->resultset('Users')->find($user_id)->key_password;
	
	if ($stored eq unix_md5_crypt($key_password,$stored)) {
		session key_password => $stored;
	}
	else {
		var error => "Invalid Password";
	}
	redirect '/';
	
		
	
};
get qr{/container/(\d+)} => sub {
	my ($container_id) = splat;
	
	if ($container->has_access($container_id)) {
		var objects   => $container->get_objects($container_id);
		var container => $container->get_container($container_id);
	}
	else {
		var denied => 1;
	}
	template 'Container/Objects';
};

get qr{/container/(\d+)/newobject} => sub {
	var container_id => splat;
	template 'Container/NewObject';	
};

post qr{/container/(\d+)/newobject} => sub {
	if (my $success = $container->newobject) {
		var success => $success;
	}
	template 'Container/NewObject';
};


get qr{/object/(\d+)/edit} => sub {
	my ($object) = splat;
	if (my $object = $container->get_object($object)) {
		var object => $object;
	}
	template 'Container/ObjectEdit';
		
};
post qr{/object/(\d+)/edit} => sub {
	my ($this) = splat;
	if (my $object = $container->edit_object) {
		var object => $object;
	}
	template 'Container/Object';
	#forward "/object/$this", undef, { method => 'GET' };
#	request->path_info("/object/$this");

};
get qr{/object/(\d+)} => sub {
        my ($object) = splat;
        if (my $object = $container->get_object($object)) {
                var object => $object;
        }
        template 'Container/Object';
};

get '/wiki/new' => sub {
	template 'wiki/new.tt';
	
};
post '/container/new' => sub {
	if (my $success = $container->add) {
		var success => $success;
	}
	template 'Container/new.tt';
	
};
get '/' => sub {
    template 'index';
};
get '/logout' => sub {
    session->destroy;
	my $hash = session;
    redirect '/login';
};

true;
