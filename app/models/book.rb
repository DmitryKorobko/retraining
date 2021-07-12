class Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre
  has_many :loans, dependent: :destroy
end
