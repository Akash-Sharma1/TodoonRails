class CreateTodolists < ActiveRecord::Migration[5.1]
  def change
    create_table :todolists do |t|
      t.string "description", :null => false
      t.string "priority", :null => false, :default => "Moderate"
      t.datetime "duedate"
      t.timestamps
    end
  end
end
