class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
         :validatable, :timeoutable, :confirmable 
  has_many :orders
  has_many :comments

  # Setup accessible (or protected) attributes for your model
  validates :first_name,  presence: true
  validates :last_name,   presence: true
  validates :email,       presence: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i  #, on: :create

end
