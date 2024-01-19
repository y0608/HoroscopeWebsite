class Post < ApplicationRecord
  belongs_to :horoscopist, class_name: "User"
end
