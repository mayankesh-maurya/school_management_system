class Batch < ApplicationRecord
  belongs_to :school
  belongs_to :course
  has_many :students

  validates :name, presence: true
end
