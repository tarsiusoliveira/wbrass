class SourcesController < ApplicationController
  before_action :set_source, only: %i[ show edit update destroy ]

  # GET /sources or /sources.json
  def index
    @sources = Source.all
  end

  # GET /sources/1 or /sources/1.json
  def show
  end

  # GET /sources/new
  def new
    @source = Source.new
    @source.spl1m ||= 94
    @source.numRays ||= 20000
    @source.audio.attach(params[:audio])
  end

  def import

  end

  # GET /sources/1/edit
  def edit
  end

  # POST /sources or /sources.json
  def create
    @source = Source.new(source_params)

    respond_to do |format|
      if @source.save
        format.html { redirect_to @source, notice: "Source was successfully created." }
        format.json { render :show, status: :created, location: @source }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sources/1 or /sources/1.json
  def update
    respond_to do |format|
      if @source.update(source_params)
        format.html { redirect_to @source, notice: "Source was successfully updated." }
        format.json { render :show, status: :ok, location: @source }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sources/1 or /sources/1.json
  def destroy
    @source.destroy
    respond_to do |format|
      format.html { redirect_to sources_url, notice: "Source was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_source
      @source = Source.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def source_params
      params.require(:source).permit(:x, :y, :z, :numRays, :rotAz, :rotEl, :spl1m, :name, :directionality, :potency, 
        :freq63hz, :freq125hz, :freq250hz, :freq500hz, :freq1khz, :freq2khz, :freq4khz, :freq8khz, :freq16khz)
    end
end
