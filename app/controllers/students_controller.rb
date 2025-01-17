class StudentsController < ApplicationController
  def index
    students = Student.all
    render json: students
  end

  def show
    student = find_student
    render json: student
  end

  def create
    student = Student.create!(student_params)
    render json: student, status: :created
  end

  def update
    student = find_student
    student.update!(student_params)
    render json: student
  end

  def destroy
    student = find_student
    student.destroy!
    render json: {}, status: :no_content
  end


  private

  def student_params
    params.permit(:id, :name, :major, :age, :instructor_id)
  end

  def find_student
    Student.find(params[:id])
  end

end
