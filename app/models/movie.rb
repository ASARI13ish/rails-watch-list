class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :lists

  validates :title, :overview, presence: true, uniqueness: true
end
