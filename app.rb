require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require("sinatra/activerecord")
require('./lib/task')
require('pg')
require('pry')
set :bind,'0.0.0.0'

get('/') do
  @list = Task.all
  erb(:home)
end

get('/add') do
  erb :add
end

post('/') do
  Task.new({
    title: params['title'],
    time: params['time']
  }).save()

  @list = Task.all
  erb :home
end
