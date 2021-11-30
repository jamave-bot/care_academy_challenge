class CoursesController < ApplicationController

    def create
        course = Course.create!(course_params)
        render json: course
    end

    def index
        render json: Course.all
    end
    
    private

    def course_params
        params.permit(:name, :release_date)
    end

end
