class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :addresses, dependent: :destroy
  has_many :carts
  has_one_attached :avatar

  validates_presence_of :first_name, :last_name

end
