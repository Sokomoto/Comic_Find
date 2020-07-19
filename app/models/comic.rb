class Comic < ApplicationRecord
	validates :title presence: true
	validates :explanation presence: true
	belongs_to :user
	has_many :comic_impression
end
