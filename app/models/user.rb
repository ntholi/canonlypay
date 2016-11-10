class User < ApplicationRecord
  has_many :posts

  GENDER_TYPES = ["","Male", "Female", "Other"]
end
