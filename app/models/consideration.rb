class Consideration < ApplicationRecord
	validates :title presence: true
	validates :consideration presence: true
	belongs_to :user
	has_many :consideration_comment
end
