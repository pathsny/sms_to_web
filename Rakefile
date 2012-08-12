require 'rake/clean'
CLEAN.include("data.db")

desc "Create local db."
task :db do
   require "sequel"

   DB = Sequel.connect(ENV['DATABASE_URL'] || "sqlite://data.db")
   DB.create_table! :in_texts do
      primary_key :text_id
      String   :from_id,
      String   :first_name,   :default => ""
      String   :last_name,   :default => ""
      String   :display_name,   :default => ""
      DateTime  :sent_time
      String  :body 
   end 

   puts "Database built."
end