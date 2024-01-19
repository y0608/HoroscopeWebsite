class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :posts, inverse_of: :horoscopist, dependent: :destroy

    enum role: { 
      horoscopist: 0, 
      viewer: 1
    }

    def horoscopist?
      role == "horoscopist"
    end
end
