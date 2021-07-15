# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :author
  has_and_belongs_to_many :genres
  has_many :loans, dependent: :destroy

  # scope :for_customer, -> { where('quantity > 0' ) }

  def available?
    quantity > 0
  end
end
