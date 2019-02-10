class Post < ApplicationRecord
  belongs_to :category

  validates :title, :description, :location, :price, 
            :currency, :purpose, presence: true
  validates :description, length: {minimum:20}
end
