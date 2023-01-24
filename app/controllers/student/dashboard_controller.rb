class Student::DashboardController < ApplicationController
    before_action :authenticate_student!
    layout 'student'
    def index
        
    end

    def show_profile
        @student=current_student
    end

    def show_transcript
        @semesters = current_student.semesters
    end

    def display_all_courses
        @enrollments=current_student.semesters.where(id:current_student.student_semesters.last.semester_id)[0].enrollments.where(grade_id:11,student_id:current_student.id)
    end

    def upload_image
        @student=Student.find(current_student.id)
        if @student.image.attach(params[:image])
            redirect_to show_profile_student_dashboard_index_path
        end
    end
end 
