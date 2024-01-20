class Post < ApplicationRecord
  belongs_to :horoscopist, class_name: "User"
  
  validates_presence_of :title, :body, :horoscopist_id

  has_many :comments, dependent: :destroy
end
