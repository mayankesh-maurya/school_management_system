class StudentsController < ApplicationController
  load_and_authorize_resource :school, except: [:approve, :deny, :classmates, :show]
  load_and_authorize_resource :course, :through => :school, except: [:approve, :deny, :classmates, :show]
  load_and_authorize_resource :batch, :through => [:course, :school], except: [:approve, :deny, :classmates, :show]
  load_and_authorize_resource :student, :through => [:batch, :course, :school], except: [:approve, :deny, :classmates, :show]

  load_resource :school, only: [:classmates, :show]
  load_resource :course, :through => :school, only: [:classmates, :show]
  load_resource :batch, :through => [:course, :school], only: [:classmates, :show]
  load_resource :student, :through => [:batch, :course, :school], only: [:classmates, :show]

  # GET /students or /students.json
  def index
  end

  # GET /students/1 or /students/1.json
  def show
    authorize! :classmates, @student
  end

  # GET /students/new
  def new
    @student = Student.new(course: @course, school: @school, batch: @batch)
    authorize! :create, @student
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students or /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to school_course_batch_student_path(@school, @course, @batch, @student), notice: "Student was successfully created." }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to school_course_batch_student_path(@school, @course, @batch, @student), notice: "Student was successfully updated." }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy

    respond_to do |format|
      format.html { redirect_to school_course_batch_students_url, notice: "Student was successfully deleted." }
      format.json { head :no_content }
    end
  end

  # PATCH /students/1/approve
  def approve
    student = Student.find(params[:id])
    student.update(status: "approved")
    respond_to do |format|
      format.html { redirect_to school_course_batch_students_url, notice: "Student enrollment approved." }
      format.json { head :no_content }
    end
  end

  # PATCH /students/1/deny
  def deny
    student = Student.find(params[:id])
    student.update(status: "denied")
    respond_to do |format|
      format.html { redirect_to school_course_batch_students_url, notice: "Student enrollment denied." }
      format.json { head :no_content }
    end
  end

  # GET /classmates
  def classmates
    authorize! :classmates, @student
    @classmates = @student.classmates
  end

  private
    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:name, :email, :password, :status, :school_id, :course_id, :batch_id)
    end
end
