class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comic, dependent: :destroy
  has_many :comic_impression, dependent: :destroy
  has_many :consideration, dependent: :destroy
  has_many :consideration_comment, dependent: :destroy

  validates :name, length: { in: 2..20 }, presence: true
  enum is_status: {有効: true, 退会済: false}

	def active_for_authentication?
		super && (self.is_status == "有効")
	end

	def inactive_message
		self.is_status == "有効" ? super : :user_status_is_not_valid
	end
end