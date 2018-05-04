class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  # GET /jobs
  # GET /jobs.json
  def index
    if params[:jobtype].blank?
    @jobs = Job.all.order("created_at  DESC")
  else
    @jobtype_id = Jobtype.find_by(name: params[:jobtype]).id
    @jobs = Job.where(:jobtype_id => @jobtype_id).order("created_at DESC")
  end

  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show

  end

  # GET /jobs/new
  def new
    @job = Job.new
    @jobtypes = Jobtype.all.map{ |j| [j.name, j.id] }
  end

  # GET /jobs/1/edit
  def edit
    @jobtypes = Jobtype.all.map{ |j| [j.name, j.id] }

  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)
    @job.jobtype_id = params[:jobtype_id]

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:companylogo, :title, :description, :urgent, :jobtype_id, :jobtype, :jobcity)
    end
end
