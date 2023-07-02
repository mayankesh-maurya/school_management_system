class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :registerable, :rememberable, :validatable
  
  belongs_to :school
  belongs_to :course
  belongs_to :batch

  enum status: %i(pending approved denied)

  def active_for_authentication?
    super && self.approved?
  end

  def inactive_message
    if self.status == "denied"
      "Your enrollment request is denied. Please contact the administrator."
    else
      "Your account is not active. Please contact the administrator."
    end
  end

  def classmates
    self.batch.students.where.not(id: self.id)
  end
end
