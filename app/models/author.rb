class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  def full_name
    self.first_name + ' ' + self.last_name
  end
end
