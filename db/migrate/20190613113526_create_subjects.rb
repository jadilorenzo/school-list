class CreateSubjects < ActiveRecord::Migration[5.2]
  create_table(:subjects) do |t|
      t.column(:title, :string)
      t.column(:time, :int)

      t.timestamps()
  end
end
