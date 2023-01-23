class Admin::StudentsController < Admin::MainController

    def index
        @students=Student.all
    end
    
    def show
        @student=Student.find(params[:id])
    end
    
    def new
        @student=Student.new
    end
    
    def create
        @student=Student.new(student_params)
        @student.semester_id=params[:semester_id]
        @student.semester_year=params[:semester_year]
        if @student.save   
            flash[:notice] = "Student was successfully created."
            redirect_to admin_students_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @student=Student.find(params[:id])
    end

    def update
        @student=Student.find(params[:id])
        @student.semester_id=params[:semester_id]
        @student.semester_year=params[:semester_year]
        if @student.update(student_params)
            flash[:notice] = "Student was successfully Updated."
            redirect_to admin_students_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @student=Student.find(params[:id])
        @student.destroy
        flash[:notice] = "Student was successfully Delete."
        redirect_to admin_students_path, status: :see_other
    end

    private
    def student_params
        params.require(:student).permit(:name,:father_name,:phone_number,:email,:password,:dob,:batch_id)
    end
end
