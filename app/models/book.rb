# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :author
  has_and_belongs_to_many :genres
  has_many :loans, dependent: :destroy

  accepts_nested_attributes_for :genres
end
