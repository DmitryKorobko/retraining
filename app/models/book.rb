# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :author
  has_and_belongs_to_many :genres
  has_many :loans, dependent: :destroy

  scope :available_now, -> { where('quantity > 0' ) }
  scope :filter_title, -> (title) { where("lower(title) LIKE '%#{title.downcase}%'") unless title.nil? }
  scope :filter_author, -> (author) { where("lower(authors.first_name) LIKE '%#{author.downcase}%' OR lower(authors.last_name) LIKE '%#{author}%'") unless author.nil? }

  def available?
    quantity > 0
  end
end
