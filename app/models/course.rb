class Course < ApplicationRecord
  belongs_to :school
  has_many :batches
  has_many :students

  validates :name, presence: true
end
