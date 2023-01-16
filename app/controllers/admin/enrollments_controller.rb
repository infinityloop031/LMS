class Admin::EnrollmentsController < ApplicationController
    
    def index
        @enrollments=Enrollment.all
    end


    def new
        @enrollment=Enrollment.new
    end
    def create
        semester_id=Student.find_by(id:params[:enrollment][:student_id].to_i).semesters[-1].id
        @enrollment=Enrollment.new(enrollment_params)
        @enrollment.semester_id=semester_id
        if @enrollment.save
            redirect_to admin_enrollments_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @enrollment=Enrollment.find(params[:id])
    end

    def update
        @enrollment=Enrollment.find(params[:id])
        semester_id=Student.find_by(id:params[:enrollment][:student_id].to_i).semesters[-1].id
        @enrollment.semester_id=semester_id
        if @enrollment.update(enrollment_params)
            redirect_to admin_enrollments_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @enrollment=Enrollment.find(params[:id])
        @enrollment.destroy
        redirect_to admin_enrollments_path
    end

    private
    
    def enrollment_params
        params.require(:enrollment).permit(:student_id,:section_id,:grade_id)
    end
end
