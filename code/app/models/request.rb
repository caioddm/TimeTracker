class Request < ActiveRecord::Base
  belongs_to :user
  attr_accessible :comment, :end, :start, :type, :date, :status
end
