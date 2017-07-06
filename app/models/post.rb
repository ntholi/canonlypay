class Post < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :post_comments
  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :product
  enum city: {
    Eastern_Cape: 'Eastern Cape',
    Free_State: 'Free State',
    Gauteng: 'Gauteng',
    KwaZulu_Natal: 'KwaZulu Natal',
    Lesotho: 'Lesotho',
    Limpopo: 'Limpopo',
    Mpumalanga: 'Mpumalanga',
    North_West: 'North West',
    Northern_Cape: 'Northern Cape',
    Western_Cape: 'Western Cape'
  }
end
