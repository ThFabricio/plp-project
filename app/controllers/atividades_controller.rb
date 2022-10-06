class AtividadesController < ApplicationController
  before_action :set_atividade, only: %i[ show edit update destroy ]

  # GET /atividades or /atividades.json
  def index
    @atividades = Atividade.all
  end

  # GET /atividades/1 or /atividades/1.json
  def show
  end

  # GET /atividades/new
  def new
    @atividade = Atividade.new
  end

  # GET /atividades/1/edit
  def edit
  end

  # POST /atividades or /atividades.json
  def create
    @atividade = Atividade.new(
      nome: atividade_params[:nome],
      descricao: atividade_params[:descricao],
      start_time: atividade_params[:start_time],
      end_time: atividade_params[:end_time],
      status: atividade_params[:status]
    )

    respond_to do |format|
      if @atividade.save
        if atividade_params[:categoria_id]
          AtividadeCategorium.create(categorium_id: atividade_params[:categoria_id], atividade_id: @atividade.id)
        end
        format.html { redirect_to "/", notice: "Atividade was successfully created." }
        format.json { render :show, status: :created, location: @atividade }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @atividade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atividades/1 or /atividades/1.json
  def update
    respond_to do |format|
      if @atividade.update(
        nome: atividade_params[:nome],
        descricao: atividade_params[:descricao],
        start_time: atividade_params[:start_time],
        end_time: atividade_params[:end_time],
        status: atividade_params[:status]
      )
        if atividade_params[:categoria_id]
          if @atividade.atividade_categoriums.all[0]
            AtividadeCategorium.find(@atividade.atividade_categoriums.all[0].id).destroy
          end
          AtividadeCategorium.create(categorium_id: atividade_params[:categoria_id], atividade_id: @atividade.id)
        end
        format.html { redirect_to atividade_url(@atividade), notice: "Atividade was successfully updated." }
        format.json { render :show, status: :ok, location: @atividade }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @atividade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atividades/1 or /atividades/1.json
  def destroy

    if @atividade.atividade_categoriums.all[0]
      AtividadeCategorium.find(@atividade.atividade_categoriums.all[0].id).destroy
    end
    @atividade.destroy

    respond_to do |format|
      format.html { redirect_to atividades_url, notice: "Atividade was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atividade
      @atividade = Atividade.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def atividade_params
      params.require(:atividade).permit(:nome, :descricao, :start_time, :end_time, :categoria_id, :status)
    end
end
