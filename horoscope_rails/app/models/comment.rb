class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  validates_presence_of :body, :user_id, :post_id
end
