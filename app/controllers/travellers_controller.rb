class TravellersController < ApplicationController
  before_action :set_traveller, only: %i[ show edit update destroy ]
  skip_forgery_protection only: :notify

  # GET /travellers or /travellers.json
  def index
    @travellers = Traveller.all
  end

  # GET /travellers/1 or /travellers/1.json
  def show
  end

  # GET /travellers/new
  def new
    @traveller = Traveller.new
  end

  # GET /travellers/1/edit
  def edit
  end

  # POST /travellers or /travellers.json
  def create
    @traveller = Traveller.new(traveller_params)

    respond_to do |format|
      if @traveller.save
        format.html { redirect_to edit_traveller_path(@traveller), notice: "Traveller was successfully created." }
        format.json { render :show, status: :created, location: @traveller }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @traveller.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /travellers/1 or /travellers/1.json
  def update
    respond_to do |format|
      if @traveller.update(traveller_params)
        format.html { redirect_to edit_traveller_path(@traveller), notice: "Traveller was successfully updated." }
        format.json { render :show, status: :ok, location: @traveller }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @traveller.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /travellers/1 or /travellers/1.json
  def destroy
    @traveller.destroy!

    respond_to do |format|
      format.html { redirect_to travellers_path, status: :see_other, notice: "Traveller was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def notify
    request_body = request.read_body
    request_body = ActiveSupport::JSON.decode(request_body)
    event = request_body["event"]
    results_page_url = request_body["results_page_url"]
    NotifyTravellersJob.perform_later(event, results_page_url)
    head :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_traveller
      @traveller = Traveller.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def traveller_params
      params.expect(traveller: [ :mobile, :event_type ])
    end
end
