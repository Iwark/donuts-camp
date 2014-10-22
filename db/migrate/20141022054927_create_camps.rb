class CreateCamps < ActiveRecord::Migration
  def change
    create_table :camps do |t|
      t.timestamps
    end
  end
end
