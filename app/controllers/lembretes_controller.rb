class LembretesController < ApplicationController
  before_action :set_lembrete, only: %i[ show edit update destroy ]

  # GET /lembretes or /lembretes.json
  def index
    @lembretes = Lembrete.all
  end

  # GET /lembretes/1 or /lembretes/1.json
  def show
  end

  # GET /lembretes/new
  def new
    @lembrete = Lembrete.new
  end

  # GET /lembretes/1/edit
  def edit
  end

  # POST /lembretes or /lembretes.json
  def create
    @lembrete = Lembrete.new(
      nome: lembrete_params[:nome],
      descricao: lembrete_params[:descricao],
      dia: lembrete_params[:dia]
    )

    respond_to do |format|
      if @lembrete.save
        if lembrete_params[:categoria_id]
          LembreteCategorium.create(categorium_id: lembrete_params[:categoria_id], lembrete_id: @lembrete.id)
        end
        format.html { redirect_to lembrete_url(@lembrete), notice: "Lembrete was successfully created." }
        format.json { render :show, status: :created, location: @lembrete }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lembrete.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lembretes/1 or /lembretes/1.json
  def update
    respond_to do |format|
      if @lembrete.update(
        nome: lembrete_params[:nome],
        descricao: lembrete_params[:descricao],
        dia: lembrete_params[:dia]
      )
        if lembrete_params[:categoria_id]
          if @lembrete.lembrete_categoriums.all[0]
            LembreteCategorium.find(@lembrete.lembrete_categoriums.all[0].id).destroy
          end
          LembreteCategorium.create(categorium_id: lembrete_params[:categoria_id], lembrete_id: @lembrete.id)
        end
        format.html { redirect_to lembrete_url(@lembrete), notice: "Lembrete was successfully updated." }
        format.json { render :show, status: :ok, location: @lembrete }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lembrete.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lembretes/1 or /lembretes/1.json
  def destroy

      if @lembrete.lembrete_categoriums.all[0]
        LembreteCategorium.find(@lembrete.lembrete_categoriums.all[0].id).destroy
      end
      @lembrete.destroy

    respond_to do |format|
      format.html { redirect_to lembretes_url, notice: "Lembrete was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lembrete
      @lembrete = Lembrete.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lembrete_params
      params.require(:lembrete).permit(:nome, :descricao, :dia, :categoria_id)
    end
end
