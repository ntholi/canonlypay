class User < ApplicationRecord
  has_many :posts

  GENDER_TYPES = ["","Male", "Female", "Other"]

  def full_name
  	"#{first_name last_name}"	
  end

  def to_s
  	display_name
  end

end
