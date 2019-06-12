class Task
  attr_accessor :time, :title

  def initialize(attributes)
    @title = attributes[:title]
    @time = attributes[:time]
  end

  def self.all
    DB.exec("SELECT * FROM subjects;").map do |hash|
      Task.new({ title: hash['title'], time: hash['time'] })
    end
  end

  def save()
    return DB.exec('DELETE FROM subjects') if self.title == 'clear'
    unless (is_already_added?(self.title))
      DB.exec("INSERT INTO subjects (title, time) VALUES ('#{@title}', '#{@time.to_i}')")
    end
  end

  def self.find(title)
    all.select { |item| item.title == title }.first
  end

  def self.list_titles
    Task.all.map { |element| element.title }
  end

  def is_already_added?(title)
    self.class.list_titles.include?(title)
  end

  def self.remove(title)
    DB.exec("DELETE FROM subjects WHERE title = '#{title}'")
  end

  def ==(another_task)
    self.title().==(another_task.title())
  end
end
