class Grade < ApplicationRecord
    has_many :enrollments
    validate :letter, presence: true
end
