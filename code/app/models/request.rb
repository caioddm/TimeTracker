class Request < ActiveRecord::Base
  default_scope :order=> 'created_at DESC'
  belongs_to :user
  attr_accessible :comment, :end, :start, :minutes, :request_type, :date, :status, :created_at
  
  STATUS_DROP = {"pending" => 0, "approved" => 1, "rejected" => 2}
  TYPE_DROP = { "regular" => 0, "sick leave" => 1, "holiday leave" => 2, "other" => 3 }
end
