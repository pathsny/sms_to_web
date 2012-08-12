require 'sinatra'
require 'sequel'

get '/hi' do
  "Hello World\n"
end

post '/sms' do
  console.log(params.inspect)
end  


configure do
   set :sessions, true
   set :logging, true

   DB = Sequel.connect(ENV['DATABASE_URL'] || 'sqlite://data.db')

   # Print all queries to stdout
   dblogger = Logger.new(STDOUT)
   def dblogger.format_message(level, time, progname, msg)
      " DATABASE - - [#{time.strftime("%d/%b/%Y %H:%M:%S")}] #{msg}\n"
   end
   DB.loggers << dblogger
end