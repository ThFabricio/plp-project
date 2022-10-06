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
    @metum = Metum.new(
      nome: metum_params[:nome],
      descricao: metum_params[:descricao],
      frequencia: metum_params[:frequencia],
      status: metum_params[:status],
      start_time: metum_params[:start_time],
    )

    if metum_params[:frequencia] == "Semanal"
      @metum.end_time = @metum.start_time + (metum_params[:quantidade_frequencia].to_i*7).weeks
    elsif metum_params[:frequencia] == "Mensal"
      @metum.end_time = @metum.start_time + metum_params[:quantidade_frequencia].to_i.months
    elsif metum_params[:frequencia] == "Anual"
      @metum.end_time = @metum.start_time + metum_params[:quantidade_frequencia].to_i.years
    end

    respond_to do |format|
      if @metum.save
        if metum_params[:categoria_id]
          MetaCategorium.create(categorium_id: metum_params[:categoria_id], metum_id: @metum.id)
        end
        format.html { redirect_to "/meta", notice: "Metum was successfully created." }
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
      if @metum.update(
        nome: metum_params[:nome],
        descricao: metum_params[:descricao],
        frequencia: metum_params[:frequencia],
        status: metum_params[:status],
      )
        if metum_params[:categoria_id]
          if @metum.meta_categoriums.all[0]
            MetaCategorium.find(@metum.meta_categoriums.all[0].id).destroy
          end
          MetaCategorium.create(categorium_id: metum_params[:categoria_id], metum_id: @metum.id)
        end
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

    if @metum.meta_categoriums.all[0]
      MetaCategorium.find(@metum.meta_categoriums.all[0].id).destroy
    end
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
      params.require(:metum).permit(:nome, :descricao, :frequencia, :status, :categoria_id, :start_time, :quantidade_frequencia)
    end
end
