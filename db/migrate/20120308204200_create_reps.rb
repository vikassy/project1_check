class CreateReps < ActiveRecord::Migration
  def change
    create_table :reps do |t|
      t.text :reep
      t.integer :forum_id
      t.integer :user_id

      t.timestamps
    end
  end
end
