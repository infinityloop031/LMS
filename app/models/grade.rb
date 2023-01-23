class Grade < ApplicationRecord
    has_many :enrollments
    validates :letter, presence: true
end
