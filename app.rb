require 'sinatra'

get '/' do
  erb :index
end

get '/resume' do
  @title = '| Resume'
  erb :resume
end

get '/about' do
  @title = '| About'
  erb :about
end

get '/projects' do
  @title = '| Projects'
  erb :projects
end

get '/contact' do
  @title = '| Contact'
  erb :contact
end

post '/contact' do
  require 'pony'
  Pony.mail({
    :to => 'landonwest5@gmail.com',
    :from => params[:email],
    :subject => params[:name] + ' has left you a message!',
    :body => 'Name: ' + params[:name] + "\n" + 'Email: ' + params[:email] + "\n\n" + 'Message: ' + params[:message],
    :via => :smtp,
    :via_options => {
      :address              => 'smtp.gmail.com',
      :port                 => '465',
      :enable_starttls_auto => true,
      :user_name            => ENV['GMAIL_USERNAME'],
      :password             => ENV['GMAIL_PASSWORD'],
      :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
      :domain               => "heroku.com" # the HELO domain provided by the client to the server
    }
  })
  redirect '/success'
end

get '/success' do
  @email_success = "Thanks, Your message has been sent!"
  erb :index
end
