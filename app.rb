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
  rating = params['rating']
  rating = rating.to_i * (-1)

  Subject.new({
    title: params['title'],
    time: params['time'],
    rating: rating
  }).save()

  @list = Subject.all

  erb :home
end

get('/subjects/:id/edit') do
  @subject = Subject.find(params.fetch("id").to_i())
  erb(:subject_edit)
end

patch("/subjects/:id") do
  title = params["title"]
  time = params["time"]
  @subject = Subject.find(params.fetch("id").to_i())
  @subject.update({:title => title, :time => time})
  @list = Subject.all
  erb :home
end

get('/subjects/:id/remove') do
  @subject = Subject.find(params.fetch("id").to_i())
  @subject.destroy()
  erb(:subject_removed)
end
