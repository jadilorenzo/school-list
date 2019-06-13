class Subject < ActiveRecord::Base

  # def self.all_ordered_by_time()
  #   returned_lists = PG.connect({:dbname => 'subjects'}).exec('SELECT * FROM subjects ORDER BY time;')
  #   lists = []
  #   returned_lists.each() do |list|
  #     id = list.fetch("id").to_i()
  #     title = list.fetch("title")
  #     time = list.fetch("time")
  #     lists.push(Subject.new({:title => title, :id => id, :time => time}))
  #   end
  #   lists
  # end

  def self.all_ordered()
    self.all.sort
  end
end
