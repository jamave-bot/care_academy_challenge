class CoursesController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :show_errors
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    before_action :find_course, only:[:show, :update, :destroy]

    def create
        course = Course.create!(course_params)
        render json: course
    end

    def index
        render json: Course.all
    end

    def show
        render json: @course
    end

    def update
        @course.update!(course_params)
        render json: @course
    end

    def destroy
        @course.destroy
        render json: @course
    end

    private

    def find_course
        @course = Course.find(params[:id])
    end

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
