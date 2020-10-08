class Tag < ApplicationRecord
	validates :tag_name, presence: true, length:{maximum:50}
	has_many :tag_maps, dependent: :destroy
	has_many :comics, through: :tag_maps
end
