class Admin::TeachersController < ApplicationController
    
    def index
        @teachers=Teacher.all
    end

    def show
        @teacher=Teacher.find(params[:id])
    end

    def new
        @teacher=Teacher.new
    end
    def create
        @teacher=Teacher.new(teacher_params)

        # fetching expertise
        courses=params[:course_ids].map {|x| x.to_i} #converting into the int
        
        # adding data into the expertise join table
        @teacher.course_ids=courses
        
        if @teacher.save    
            redirect_to admin_teachers_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @teacher=Teacher.find(params[:id])
    end

    def update
        @teacher=Teacher.find(params[:id])  
        if @teacher.update(teacher_params)
            redirect_to admin_teacher_path(@teacher)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @teacher=Teacher.find(params[:id])
        @teacher.destroy
        redirect_to admin_teachers_path, status: :see_other
    end

    private

    def teacher_params
        params.require(:teacher).permit(:name,:father_name,:address,:phone_number,:email,:password,:dob)
    end
end
