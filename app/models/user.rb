class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Veuillez saisir un email valide s'il vous plaît." }

  enum status: {
    customer: 0,
    user: 1,
    administrator: 2
  }, _prefix: true


end
