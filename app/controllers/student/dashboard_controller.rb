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
            update_img
        end
    end

    def change_password
        @user = current_student
        if @user.update_with_password(password_params)
            sign_in :student,@user, bypass: true
            flash[:notice]="Successfully Changed Password!"
            redirect_to show_profile_student_dashboard_index_path
        else
            flash[:notice]="Incorrect Current Password!"
            redirect_to show_profile_student_dashboard_index_path
        end
    end

    private

    def password_params
        params.permit(:current_password,:password,:password_confirmation)
    end


    def update_img
        render turbo_stream: [turbo_stream.replace("profileimage",
                                                    partial: "student/dashboard/image",
                                                    locals:{image: current_student.image}),
                              turbo_stream.update("notice","Picture is Succesfully Uploaded!")
                             ]
    end

end 
