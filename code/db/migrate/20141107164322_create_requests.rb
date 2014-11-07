class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.date :date
      t.time :start
      t.time :end
      t.text :comment
      t.integer :type
      t.integer :integer
      t.references :user

      t.timestamps
    end
    add_index :requests, :user_id
  end
end
