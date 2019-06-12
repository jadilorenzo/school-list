require('rspec')
require('pg')
require('task')

DB = PG.connect({:dbname => 'subjects_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM subjects *;")
  end
end

describe(Task) do
  it("starts off with no lists") do
      expect(Task.all()).to(eq([]))
  end

  it("updates state based on database") do
    task = Task.new({title: 'title', time: 5})
    task.save()
    list = Task.list_titles
    expect(list).to(eq(['title']))
  end

  it("creates a task") do
    task1 = Task.new({:title => "learn SQL", :time => 10})
    expect(Task.all)
  end

  describe("#==") do
    it("is the same task if it has the same title") do
      task1 = Task.new({:title => "learn SQL", :time => 10})
      task2 = Task.new({:title => "learn SQL", :time => 10})
      expect(task1).to(eq(task2))
    end
  end
end
