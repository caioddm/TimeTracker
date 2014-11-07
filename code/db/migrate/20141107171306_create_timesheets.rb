class CreateTimesheets < ActiveRecord::Migration
  def change
    create_table :timesheets do |t|
      t.date :date
      t.time :clockin
      t.time :clockout
      t.integer :minutes
      t.integer :type
      t.references :user

      t.timestamps
    end
    add_index :timesheets, :user_id
  end
end
