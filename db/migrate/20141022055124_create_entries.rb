class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :user_id
      t.integer :camp_id
      t.integer :status

      t.timestamps

      t.index :user_id
      t.index :camp_id
    end
  end
end
