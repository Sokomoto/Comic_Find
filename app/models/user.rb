class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comics, dependent: :destroy
  has_many :impressions, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :profile_image

  validates :name, length: { in: 2..20 }, presence: true

  enum is_status: {有効: true, 退会済: false}
  #有効ユーザーはture、退会済みユーザーはfalse

	def active_for_authentication?
		super && (self.is_status == "有効")
	end
  #is_activeが有効の場合は有効ユーザー(ログイン可能)

	def inactive_message
		self.is_status == "有効" ? super : :user_status_is_not_valid
	end

  def self.search(search)
    return User.all unless search
    User.find_by_sql(["select * from Users where name LIKE ?", "%#{search}%"])
  end
end