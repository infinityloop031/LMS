class Admin::TeachersController < Admin::MainController
    
    def index
        @teachers=Teacher.all
        respond_to do |format|
			format.turbo_stream {
				render turbo_stream: turbo_stream.update('main', template: 'admin/teachers/index')
			}
		end
    end

    def show
        @teacher=Teacher.find(params[:id])
    end

    def new
        @teacher=Teacher.new
    end
    def create
        @teacher=Teacher.new(teacher_params)
        if params[:course_ids]
            # adding data into the expertise join table
            @teacher.course_ids=params[:course_ids]
        else
            flash[:notice]="Expertise is Missing!"
            redirect_to new_admin_teacher_path and return
        end

        if @teacher.save    
            flash[:notice] = "Teacher was successfully Created."
            redirect_to admin_teachers_path
        else
            render :new
        end
    end

    def edit
        @teacher=Teacher.find(params[:id])
    end

    def update
        @teacher=Teacher.find(params[:id])  
        if @teacher.update(teacher_params)
            flash[:notice] = "Teacher was successfully Updated."
            redirect_to admin_teacher_path(@teacher)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @teacher=Teacher.find(params[:id])
        @teacher.destroy
        flash[:notice] = "Teacher was successfully Delete."
        redirect_to admin_teachers_path, status: :see_other
    end

    private

    def teacher_params
        params.require(:teacher).permit(:name,:father_name,:address,:phone_number,:email,:password,:dob)
    end
end
