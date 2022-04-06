class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  # GET /projects or /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1 or /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new  temperature: 36.0,
                            pressure: 1,
                            humidity: 40.0,
                            sampleRate: 44100,
                            irDuration: 3.0,
                            maxReflections: 50,
                            energyDecay: -60,
                            numRays: 10000,
                            clusterOrder: 3,
                            artificialTail: true
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }

      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def project_params
    puts params
    params.require(:project).permit(:temperature, :pressure, :humidity, :sampleRate,
      :irDuration, :maxReflections, :energyDecay, :numRays, :clusterOrder, :diffuseProcessing,
      :saveLateRays, :artificialTail, :saveDiffuseRays, :auralization, :autocad_file, 
      positionee_source_names:[],positionee_receiver_names:[], positionee_plan_names:[])
    end
  end
