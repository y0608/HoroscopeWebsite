class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :posts, inverse_of: :horoscopist, dependent: :destroy
    has_many :comments, dependent: :destroy

    enum role: { 
      horoscopist: 0, 
      viewer: 1,
      admin: 2
    }

    def horoscopist?
      role == "horoscopist"
    end

    def viewer?
      role == "viewer"
    end

    def admin?
      role == "admin"
    end
end
