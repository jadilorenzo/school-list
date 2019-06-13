require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require("sinatra/activerecord")
require('./lib/subject')
require('pg')
require('pry')
set :bind,'0.0.0.0'

get('/') do
  @list = Subject.all
  erb(:home)
end

get('/add') do
  erb :add
end

post('/') do
  Subject.new({
    title: params['title'],
    time: params['time']
  }).save()

  @list = Subject.all
  erb :home
end
