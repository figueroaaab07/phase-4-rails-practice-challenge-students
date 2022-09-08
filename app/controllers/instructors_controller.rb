class InstructorsController < ApplicationController
  def index
    instructors = Instructor.all
    render json: instructors
  end

  def show
    instructor = find_instructor
    render json: instructor
  end

  def update
    instructor = find_instructor
    instructor.update!(params)
    render json: instructor
  end

  def destroy
    instructor = find_instructor
    instructor.destroy!
    render json: {}, status: :no_content
  end


  private

  def instructor_params
    params.permit(:id, :name)
  end

  def find_instructor
    Instructor.find(params[:id])
  end
end
