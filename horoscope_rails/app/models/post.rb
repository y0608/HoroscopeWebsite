class Post < ApplicationRecord
    # belongs_to :horoscopist, class_name: "User"
    has_many :comments, dependent: :destroy
    validates :body, presence: true
end
