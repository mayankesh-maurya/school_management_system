class SchoolsController < ApplicationController
  # before_action :set_school, only: %i[ show edit update destroy ]
  load_and_authorize_resource

  # GET /schools or /schools.json
  def index
  end

  # GET /schools/1 or /schools/1.json
  def show
  end

  # GET /schools/new
  def new
  end

  # GET /schools/1/edit
  def edit
  end

  # POST /schools or /schools.json
  def create

    respond_to do |format|
      if @school.save
        format.html { redirect_to school_url(@school), notice: "School was successfully created." }
        format.json { render :show, status: :created, location: @school }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schools/1 or /schools/1.json
  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to school_url(@school), notice: "School was successfully updated." }
        format.json { render :show, status: :ok, location: @school }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schools/1 or /schools/1.json
  def destroy
    @school.destroy

    respond_to do |format|
      format.html { redirect_to schools_url, notice: "School was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def school_params
      params.require(:school).permit(:name, :description)
    end
end
