class CoursesController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :show_errors
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def create
        course = Course.create!(course_params)
        render json: course
    end

    def index
        render json: Course.all
    end

    def show
        course = Course.find(params[:id])
        render json: course
    end

    def update
        course = Course.find(params[:id])
        course.update(course_params)
        render json: course
    end

    def destroy
        course = Course.find(params[:id])
        course.destroy
        render json: course
    end

    private

    def show_errors(invalid)
        render json: {errors: invalid.record.errors.full_messages}
    end

    def not_found
        render json: {errors: 'Course not found'}, status: :not_found
    end

    def course_params
        params.permit(:name, :release_date)
    end


end
