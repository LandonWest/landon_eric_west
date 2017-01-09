require 'sinatra'
require 'pony'
require 'pry'

get '/' do
  erb :index
end

post '/layout' do
  configure_pony
  begin
    Pony.mail({
      :to => 'landonewest@gmail.com',
      :from => params[:email],
      :subject => params[:name] + ' has left you a message!',
      :body => "Name: #{params[:name]}\n
                Email: #{params[:email]}\n\n
                Message:  #{params[:message]}"
    })
    redirect '/success'
  rescue
    @exception = logger.error
    @params = params.inspect
    erb :error_page
  end
end

get '/success' do
  @email_success = "Thanks, Your message has been sent!"
  erb :index
end

# get '/resume' do
#   @title = '| Resume'
#   erb :resume
# end
#
# get '/projects' do
#   @title = '| Projects'
#   erb :projects
# end

def configure_pony
  Pony.options = {
    :via => :smtp,
    :via_options => {
      :address              => 'smtp.sendgrid.net',
      :port                 => '587',
      :enable_starttls_auto => true,
      :user_name            => ENV['SENDGRID_USERNAME'],
      :password             => ENV['SENDGRID_PASSWORD'],
      :authentication       => :plain,
      :domain               => "heroku.com"
    }
  }
end
