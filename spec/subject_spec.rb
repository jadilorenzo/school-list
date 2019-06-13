require("rspec")
require("pg")
require("sinatra/activerecord")
require("subject")

RSpec.configure do |config|
  config.after(:each) do
    Subject.all().each() do |subject|
      subject.destroy()
    end
  end
end
