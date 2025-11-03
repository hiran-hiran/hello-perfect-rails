class Book < ApplicationRecord
  scope :costly, -> { where("price > ?", 3000) }
  scope :written_about, ->(word) { where("name like ?", "%#{word}%") }

  belongs_to :publisher
end
