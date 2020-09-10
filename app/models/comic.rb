class Comic < ApplicationRecord
	validates :title, presence: true
	validates :explanation, presence: true
	belongs_to :user
	attachment :image
	has_many :impressions, dependent: :destroy
end
