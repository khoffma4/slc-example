Rails.application.config.middleware.use OmniAuth::Builder do

  if Rails.env.production?
    provider :slc, ENV[:SLC_KEY], ENV['SLC_SECRET']
  else
    #{:redirect_uri =>  "http://localhost:3000/auth/slc/callback"},
    provider :slc, ENV['SLC_SANDBOX_KEY'], ENV['SLC_SANDBOX_SECRET'], :setup => lambda{|env|
       env['omniauth.strategy'].options[:client_options].site = 'https://api.sandbox.slcedu.org',
       # env['omniauth.strategy'].options[:redirect_uri].localhost = 'http://localhost:3000/auth/slc/callback'
       #env['omniauth.params'] = {:redirect_uri => 'http://localhost:3000/auth/slc/callback'}
       #env['omniauth.params'] = {:redirect_uri => URI.parse("http://localhost:3000/auth/slc/callback")}
       #{:redirect_uri =>  "http://localhost:3000/auth/slc/callback"}
    }
  end

end