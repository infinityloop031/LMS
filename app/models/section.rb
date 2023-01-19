class Section < ApplicationRecord
  belongs_to :semester
  belongs_to :teacher
  belongs_to :course

  has_many :enrollments
  validates :name, presence: true
end
