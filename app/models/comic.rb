class Comic < ApplicationRecord
	validates :title, presence: true
	validates :explanation, presence: true
	belongs_to :user
	attachment :image
	has_many :comic_impressions, dependent: :destroy
end
