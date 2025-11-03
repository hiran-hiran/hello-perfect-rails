class Book < ApplicationRecord
  enum :sales_status, {
    reservation: 0, # 予約受付
    now_on_sale: 1, # 発売中
    end_of_print: 2 # 販売終了
  }

  scope :costly, -> { where("price > ?", 3000) }
  scope :written_about, ->(word) { where("name like ?", "%#{word}%") }

  belongs_to :publisher
  has_many :book_authors
  has_many :authors, through: :book_authors

  validates :name, presence: true
  validates :name, length: { maximum: 25 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }



  before_validation :add_lovely_to_cat

  after_destroy do
    Rails.logger.info "Book is deleted: #{self.attributes}"
  end

  private
    def add_lovely_to_cat
      self.name = self.name.gsub(/Cat/) do |matched|
        "lovely #{matched}"
      end
    end
end
