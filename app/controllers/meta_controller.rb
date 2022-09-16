class MetaController < ApplicationController
  before_action :set_metum, only: %i[ show edit update destroy ]

  # GET /meta or /meta.json
  def index
    @meta = Metum.all
  end

  # GET /meta/1 or /meta/1.json
  def show
  end

  # GET /meta/new
  def new
    @metum = Metum.new
  end

  # GET /meta/1/edit
  def edit
  end

  # POST /meta or /meta.json
  def create
    @metum = Metum.new(metum_params)

    respond_to do |format|
      if @metum.save
        format.html { redirect_to metum_url(@metum), notice: "Metum was successfully created." }
        format.json { render :show, status: :created, location: @metum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @metum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meta/1 or /meta/1.json
  def update
    respond_to do |format|
      if @metum.update(metum_params)
        format.html { redirect_to metum_url(@metum), notice: "Metum was successfully updated." }
        format.json { render :show, status: :ok, location: @metum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @metum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meta/1 or /meta/1.json
  def destroy
    @metum.destroy

    respond_to do |format|
      format.html { redirect_to meta_url, notice: "Metum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_metum
      @metum = Metum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def metum_params
      params.require(:metum).permit(:nome, :descricao, :frequencia, :status)
    end
end
