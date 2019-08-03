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
get ('/projects/:id') do
  @project = Project.find(params[:id].to_i())
  erb(:project)
end

get ('/projects/:id/edit') do
  @project = Project.find(params[:id].to_i())
  erb(:edit_project)
end

get ('/projects/:id/volunteers/:v_id') do
  @project = Project.find(params[:id].to_i())
  @volunteer = Volunteer.find(params[:v_id].to_i())
  erb(:edit_volunteer)
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
patch ('/projects/:p_id/volunteers/:id') do
  @volunteer = Volunteer.find(params[:id].to_i())
  @project = Project.find(params[:p_id].to_i())
  @volunteer.update(params)
  redirect to("/projects/#{params[:p_id]}")
end

delete ('/project/:id') do
  @project = Project.find(params[:id].to_i())
  @project.delete()
  redirect to('/')
end
