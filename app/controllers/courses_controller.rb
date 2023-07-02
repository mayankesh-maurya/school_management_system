class CoursesController < ApplicationController
  load_and_authorize_resource :school
  load_and_authorize_resource :course, :through => :school

  # GET /courses or /courses.json
  def index
  end

  # GET /courses/1 or /courses/1.json
  def show
  end

  # GET /courses/new
  def new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses or /courses.json
  def create

    respond_to do |format|
      if @course.save
        format.html { redirect_to school_course_path(@school, @course), notice: "Course was successfully created." }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to school_course_path(@school, @course), notice: "Course was successfully updated." }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1 or /courses/1.json
  def destroy
    @course.destroy

    respond_to do |format|
      format.html { redirect_to school_courses_url, notice: "Course was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:name, :description, :school_id)
    end
end
