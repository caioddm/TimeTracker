class Request < ActiveRecord::Base
  belongs_to :user
  attr_accessible :comment, :end, :start, :request_type, :date, :status
  
  STATUS_DROP = {"pending" => 0, "approved" => 1, "rejected" => 2}
  TYPE_DROP = { "regular" => 0, "sick leave" => 1, "holiday leave" => 2, "other" => 3 }
end
