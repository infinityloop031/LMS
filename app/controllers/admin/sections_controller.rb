class Admin::SectionsController < Admin::MainController

    def index
        @sections=Section.all
        respond_to do |format|
			format.turbo_stream {
				render turbo_stream: turbo_stream.update('main', template: 'admin/sections/index')
			}
		end
    end

    def show
    end

    def new
        @section=Section.new
    end

    def create
        @section=Section.new(section_params)
        if @section.save
            flash[:notice] = "Section was successfully Created."
            redirect_to admin_sections_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @section=Section.find(params[:id])
    end

    def update
        @section=Section.find(params[:id])
        if @section.update(section_params)
            flash[:notice] = "Section was successfully Updated."
            redirect_to admin_sections_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @section=Section.find(params[:id])
        if @section.destroy
            flash[:notice] = "Section was successfully Delete."
            redirect_to admin_sections_path, status: :see_other
        else
            flash[:error] = 'asdfasfsadf'
            # redirect_to
        end
        
    end

    private
    def section_params
        params.require(:section).permit(:course_id,:teacher_id,:semester_id,:name)
    end

end
