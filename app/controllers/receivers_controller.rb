class ReceiversController < ApplicationController
  before_action :set_receiver, only: %i[ show edit update destroy ]

  # GET /receivers or /receivers.json
  def index
    @receivers = Receiver.all
  end

  # GET /receivers/1 or /receivers/1.json
  def show
  end

  # GET /receivers/new
  def new
    @receiver = Receiver.new
  end

  # GET /receivers/1/edit
  def edit
  end

  # POST /receivers or /receivers.json
  def create
    @receiver = Receiver.new(receiver_params)

    respond_to do |format|
      if @receiver.save
        format.html { redirect_to @receiver, notice: "Receiver was successfully created." }
        format.json { render :show, status: :created, location: @receiver }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @receiver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receivers/1 or /receivers/1.json
  def update
    respond_to do |format|
      if @receiver.update(receiver_params)
        format.html { redirect_to @receiver, notice: "Receiver was successfully updated." }
        format.json { render :show, status: :ok, location: @receiver }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @receiver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receivers/1 or /receivers/1.json
  def destroy
    @receiver.destroy
    respond_to do |format|
      format.html { redirect_to receivers_url, notice: "Receiver was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receiver
      @receiver = Receiver.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def receiver_params
      params.require(:receiver).permit(:x, :y, :z, :reception_ray, :rotation, :name, :directionality)
    end
end
