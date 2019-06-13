require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require("sinatra/activerecord")
require('./lib/subject')
require('pg')
require('pry')
set :bind,'0.0.0.0'

get('/') do
  @list = Subject.all_ordered()
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

  @list = Subject.all_ordered()
  erb :home
end

get('/subjects/:id/edit') do
  @subject = Subject.find(params.fetch("id").to_i())
  erb(:subject_edit)
end

patch("/subjects/:id") do
  title = params.fetch("title")
  time = params.fetch("time")
  @subject = Subject.find(params.fetch("id").to_i())
  @subject.update({:title => title, :time => time})
  @list = Subject.all_ordered()
  erb :home
end
