class User < ApplicationRecord

  has_secure_password

  has_many :posts
  has_many :companies
  validates :phone_number, presence: true
  validates_uniqueness_of :phone_number

  GENDER_TYPES = ["","Male", "Female", "Other"]

  def full_name
  	"#{first_name} #{last_name}"
  end

end
