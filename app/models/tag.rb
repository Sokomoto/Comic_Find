class Tag < ApplicationRecord
	has_many :tag_maps, dependent: :destroy
	has_many :comics, through: :tag_maps
	validates :tag_name, uniqueness: true, presence: true, length:{maximum:30}
end
