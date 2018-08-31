class StudentsController < ApplicationController
  before_action :set_student, only: :show

  def index
    @students = Student.all
  end

  def show
    @student = Student.find_by_id(params[:id])
  end

  def activate
    @student = Student.find_by_id(params[:id])
    if @student.active
      @student.active = false
    else
      @student.active = true
    end
    @student.save
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end
