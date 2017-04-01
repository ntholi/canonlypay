class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :companies
  # validates :phone_number, presence: true
  validates_uniqueness_of :phone_number
  validates_uniqueness_of :email

  GENDER_TYPES = ["","Male", "Female", "Other"]

  def full_name
  	"#{first_name} #{last_name}"
  end
  
end
