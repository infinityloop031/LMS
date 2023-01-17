class Teacher::DashboardController < ApplicationController
    def index
    end

    def showprofile
    end

    def courses
        @teacher_sections=current_teacher.sections  
    end
    def pastcourses
        @teacher_sections=current_teacher.sections
    end
end
