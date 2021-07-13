class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :loans

  def librarian?
    type == 'Librarian'
  end

  def customer?
    type == 'Customer'
  end
end
