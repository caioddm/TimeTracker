class User < ActiveRecord::Base
  has_many :timesheets
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :user_id
  attr_accessible :email, :password, :password_confirmation, :remember_me

  attr_accessible :address, :allowOutsideLogin, :email, :exempt, :phone, :name, :last_name, :password, :username, :is_admin, :is_user_active
  validates :name, presence: true
  validates :phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: " should have the format xxx-xxx-xxxx with only 10 digits" }
  
end
