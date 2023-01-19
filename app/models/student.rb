class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :name, presence: true
  validates :father_name, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: {minimum: 6}

  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  
  # batch relation
  belongs_to :batch
  
  # student-semester relation
  has_many :student_semesters, dependent: :destroy
  has_many :semesters, through: :student_semesters

  has_many :enrollments, dependent: :destroy


  private 

 
end
