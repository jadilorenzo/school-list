class CreateTasks < ActiveRecord::Migration[4.2]
  def change
    create_table(:subjects) do |t|
      t.column(:title, :string)
      t.column(:time, :int)

      t.timestamps()
    end
  end
end
