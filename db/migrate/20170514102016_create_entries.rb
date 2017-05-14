class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :description, null: false
      t.boolean :completed, default: false
      t.timestamps
    end 
  end
end
