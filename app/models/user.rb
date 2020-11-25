class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one :address, dependent: :destroy
  has_many :carts
  has_one_attached :avatar
  accepts_nested_attributes_for :address
  validates_presence_of :first_name, :last_name

  def address_attributes=(address_attributes)
    address_attributes.each do |i, address_attributes|
      self.address.build(address_attributes)
    end 
    
  end

end
