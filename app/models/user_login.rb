class UserLogin < ApplicationRecord
  include ActiveModel::Validations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :user
  validates :admin, inclusion: { in: [true, false] }

end
