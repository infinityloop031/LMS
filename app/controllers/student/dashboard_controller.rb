class Student::DashboardController < ApplicationController
    before_action :authenticate_student!
    def index
        
    end

    def showprofile
    end

    def showtranscript
        @semesters=current_student.semesters
    end

    def display_All_courses
        @enrollments=current_student.semesters.where(id:current_student.student_semesters.last.semester_id)[0].enrollments.where(grade_id:11,student_id:current_student.id)
    end
end
