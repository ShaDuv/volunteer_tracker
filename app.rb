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
get ('/project/:id') do
  @project = Project.find(params[:id].to_i())
  erb(:project)
end

get ('/project/:id/edit') do
  @project = Project.find(params[:id].to_i())
  erb(:edit_project)
end

post('/') do
  project = Project.new(params)
  project.save()
  redirect to('/')
end

patch ('/projects/:id') do
  @project = Project.find(params[:id].to_i())
  @project.update(params)
  redirect to('/')
end
