class AddImportanceToSubjects < ActiveRecord::Migration[5.2]
  def change
    add_column(:subjects, :rating, :int)
  end
end
