class Teacher::DashboardController < ApplicationController
    before_action :authenticate_teacher!
    layout 'teacher'
    def index
    end

    def show_profile
    end

    def courses
        @teacher_sections=current_teacher.sections  
    end
    def past_courses
        @teacher_sections=current_teacher.sections
    end
end
