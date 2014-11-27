class AddMinutesToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :minutes, :integer
  end
end
