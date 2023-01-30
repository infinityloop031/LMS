class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  #after_update_commit :create_student_semester
  # after_update :create_student_semester

  attr_accessor :semester_id,:semester_year

  validates :name, presence: true
  validates :father_name, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: {minimum: 6} , on: :create
  validates :image, presence: { message: "must be attached." }

  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  # batch relation
  belongs_to :batch
  
  # student-semester relation
  has_many :student_semesters, dependent: :destroy
  has_many :semesters, through: :student_semesters

  has_many :enrollments, dependent: :destroy

  has_one_attached :image do |attachable|
    attachable.variant :small, resize: "50x50"
    attachable.variant :medium, resize: "100x100"
    attachable.variant :large, resize: "300x300"
  end


  after_save_commit :create_student_semester
  after_create_commit :create_variants

  private 
  

  def create_student_semester
    return if self.student_semesters.where(semester_id: self.semester_id, year: self.semester_year).any?
    self.student_semesters.create(semester_id: semester_id ,year: semester_year)
  end
 
end
