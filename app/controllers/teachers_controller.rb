class TeachersController < ApplicationController

  # GET /teachers or /teachers.json
  def index
    @teachers = Teacher.all
  end

  # GET /teachers/1 or /teachers/1.json
  def show
    @teacher = Teacher.find(params[:id])
  end
end
