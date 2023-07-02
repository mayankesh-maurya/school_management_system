class BatchesController < ApplicationController
  load_and_authorize_resource :school
  load_and_authorize_resource :course, :through => :school
  load_and_authorize_resource :batch, :through => [:course, :school], except: [:new, :create]

  # GET /batches or /batches.json
  def index
  end

  # GET /batches/1 or /batches/1.json
  def show
  end

  # GET /batches/new
  def new
    @batch = Batch.new(course: @course, school: @school)
    authorize! :create, @batch
  end

  # GET /batches/1/edit
  def edit
  end

  # POST /batches or /batches.json
  def create
    @batch = Batch.new(batch_params)
    
    respond_to do |format|
      if @batch.save
        format.html { redirect_to school_course_batch_path(@school, @course, @batch), notice: "Batch was successfully created." }
        format.json { render :show, status: :created, location: @batch }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /batches/1 or /batches/1.json
  def update
    respond_to do |format|
      if @batch.update(batch_params)
        format.html { redirect_to school_course_batch_path(@school, @course, @batch), notice: "Batch was successfully updated." }
        format.json { render :show, status: :ok, location: @batch }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batches/1 or /batches/1.json
  def destroy
    @batch.destroy

    respond_to do |format|
      format.html { redirect_to school_course_batches_url, notice: "Batch was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def batch_params
      params.require(:batch).permit(:name, :description, :school_id, :course_id)
    end
end
