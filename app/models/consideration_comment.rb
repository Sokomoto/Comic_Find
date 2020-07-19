class ConsiderationComment < ApplicationRecord
	belongs_to :user
	belongs_to :consideration
end
