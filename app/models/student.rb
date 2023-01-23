class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  after_save :create_student_semester
  after_update :create_student_semester

  attr_accessor :semester_id,:semester_year

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

  def create_student_semester
    self.student_semesters.create(semester_id: semester_id ,year: semester_year )
  end

 
end
