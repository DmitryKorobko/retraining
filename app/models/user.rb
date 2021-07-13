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

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def self.user_types
    %i[Customer Librarian]
  end
end
