class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    @student.house_id = rand(5..8)
    @student.save

    redirect_to student_path(@student)
  end

private
  def student_params
    params.require(:student).permit(:name, :img_url, :house)
  end

end
