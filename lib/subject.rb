class Subject < ActiveRecord::Base

  default_scope { order(:rating) }
  # def self.all_ordered()
    # self.all.order(:time)
  # end
end
