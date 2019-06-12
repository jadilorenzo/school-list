class CreateTasks < ActiveRecord::Migration[4.2]
  def change
    create_table(:tasks) do |t|
      t.column(:description, :string)
      t.column(:time, :int)

      t.timestamps()
    end
  end
end
