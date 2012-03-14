class CreateComs < ActiveRecord::Migration
  def change
    create_table :coms do |t|
      t.text :comments
      t.integer :micropost_id
      t.integer :user_id

      t.timestamps
    end
  end
end
