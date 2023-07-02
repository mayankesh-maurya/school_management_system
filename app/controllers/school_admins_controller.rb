class SchoolAdminsController < ApplicationController
  load_and_authorize_resource :school
  load_and_authorize_resource :school_admin, :through => :school
  # before_action :set_school
  # before_action :set_school_admin, only: %i[ show edit update destroy ]

  # GET /school_admins or /school_admins.json
  def index
  end

  # GET /school_admins/1 or /school_admins/1.json
  def show
  end

  # GET /school_admins/new
  def new
  end

  # GET /school_admins/1/edit
  def edit
  end

  # POST /school_admins or /school_admins.json
  def create

    respond_to do |format|
      if @school_admin.save
        format.html { redirect_to school_school_admin_path(@school, @school_admin), notice: "School admin was successfully created." }
        format.json { render :show, status: :created, location: @school_admin }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @school_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /school_admins/1 or /school_admins/1.json
  def update
    respond_to do |format|
      if @school_admin.update(school_admin_params)
        format.html { redirect_to school_school_admin_path(@school, @school_admin), notice: "School admin was successfully updated." }
        format.json { render :show, status: :ok, location: @school_admin }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @school_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /school_admins/1 or /school_admins/1.json
  def destroy
    @school_admin.destroy

    respond_to do |format|
      format.html { redirect_to school_school_admins_url, notice: "School admin was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def school_admin_params
      params.require(:school_admin).permit(:name, :email, :password)
    end
end
