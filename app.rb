require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/volunteer')
require('pry')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => 'volunteer_tracker_test'})

get ('/') do
  @project = Project.all
  erb(:home)
end

post('/') do
  title = params[:title]
  project = Project.new({:title => title, :id => nil})
  project.save()
  redirect to('/')
end
