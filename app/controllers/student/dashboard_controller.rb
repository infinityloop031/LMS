class Student::DashboardController < ApplicationController
    before_action :authenticate_student!
    def index
        
    end

    def showtranscript
        @semesters=current_student.semesters
    end

    def display_All_courses
        @enrollments=current_student.semesters[-1].enrollments.where(grade_id:11)
    end
end
