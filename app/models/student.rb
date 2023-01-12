class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  
  # batch relation
  belongs_to :batch
  
  # student-semester relation
  has_many :student_semesters, dependent: :destroy
  has_many :semesters, through: :student_semesters

  has_many :enrollments, dependent: :destroy

end
