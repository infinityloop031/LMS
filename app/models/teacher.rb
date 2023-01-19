class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :name, presence: true
  validates :father_name, presence: true
  validates :phone_number, presence: true
  validates :address, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: {minimum: 6}
  

  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  has_many :sections

  has_and_belongs_to_many :courses, join_table: "expertises"
end
