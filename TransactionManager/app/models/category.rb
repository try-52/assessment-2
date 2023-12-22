class Category < ApplicationRecord
  has_many :transactions, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
