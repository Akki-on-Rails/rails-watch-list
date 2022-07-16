class Movie < ApplicationRecord
  has_many :bookmarks
  # has_many :list, through: :bookmark, dependent: :destroy
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
end
