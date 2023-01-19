class Admin::CoursesController < Admin::MainController
    
    def index
        @courses=Course.all
    end
    
    def show
        @course=Course.find(params[:id])
    end

    def new
        @course=Course.new
    end
    
    def create
        @course=Course.new(course_params)
        if @course.save
            flash[:notice] = "Course was successfully Created."
            redirect_to admin_courses_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def edit
        @course=Course.find(params[:id])
    end

    def update
        @course=Course.find(params[:id])
        if @course.update(course_params)
            flash[:notice] = "Course was successfully Updated."
            redirect_to admin_courses_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @course=Course.find(params[:id])
        @course.destroy
        flash[:notice] = "Course was successfully Delete."
        redirect_to admin_courses_path,  status: :see_other
    end

    private
    def course_params

        params.require(:course).permit(:name,:coursecode)
    end

end
