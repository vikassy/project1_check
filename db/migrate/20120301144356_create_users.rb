class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :profession
      t.string :qualification

      t.timestamps
    end
  end
end
