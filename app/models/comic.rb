class Comic < ApplicationRecord
	validates :title, presence: true
	validates :explanation, presence: true
	belongs_to :user
	attachment :image
	has_many :impressions, dependent: :destroy
	has_many :favorites, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

	def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  	end

	def save_tags(tags)
		current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
		old_tags = current_tags - tags
		new_tags = tags - current_tags

		old_tags.each do |old_name|
			self.tags.delete Tag.find_by(tag_name: old_name)
		end

		new_tags.each do |new_name|
			comic_tag = Tag.find_or_create_by(tag_name: new_name)
			self.tags << comic_tag
		end
	end

  def self.search(search)
    if search
      Comic.where(['title LIKE ?', "%#{search}%"])
    else
      Comic.all
    end
  end

end
