class School < ApplicationRecord
	has_many :school_admins
	has_many :courses
	has_many :batches
	has_many :students

	validates :name, presence: true
end
