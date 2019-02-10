class Category < ApplicationRecord
    has_many :posts, dependent: :delete_all
    validates :name, presence: true, uniqueness: true
end
