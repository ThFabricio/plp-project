class RelatoriosController < ApplicationController

  def index
  end

  def relatorio1
    @metas, @metas_concluidas = pegar_metas_concluidas
  end

  def relatorio2
    @atividades, @atividades_concluidas = pegar_atividades_concluidas
  end

  def relatorio3
    conn = ActiveRecord::Base.connection

    @result = conn.execute "SELECT * FROM atividades"
  end

  def relatorio4
    # Destacar os turnos mais produtivos
  end

  def relatorio5
    atividades, atividades_concluidas = pegar_atividades_concluidas
    @qtd_atividades_por_categoria = {}
    atividades_concluidas.each do |atividade|
      categoria = atividade.categoriums.all[0]
      if @qtd_atividades_por_categoria.has_key?(categoria.nome)
        @qtd_atividades_por_categoria[categoria.nome] += 1
      else
        @qtd_atividades_por_categoria[categoria.nome] = 1
      end
    end

    @qtd_atividades_por_categoria.sort_by {|k, v| v}  end

  def relatorio6
    metas, metas_concluidas = pegar_metas_concluidas
    @qtd_metas_por_categoria = {}
    metas_concluidas.each do |meta|
      categoria = meta.categoriums.all[0]
      if @qtd_metas_por_categoria.has_key?(categoria.nome)
        @qtd_metas_por_categoria[categoria.nome] += 1
      else
        @qtd_metas_por_categoria[categoria.nome] = 1
      end
    end

    @qtd_metas_por_categoria.sort_by {|k, v| v}
  end

  private
    def pegar_metas_concluidas
      metas = Metum.all
      metas_concluidas = []
      metas.each do |meta|
        if meta.status == "Concluída"
          metas_concluidas << meta
        end
      end

      [metas, metas_concluidas]
    end

    def pegar_atividades_concluidas
      atividades = Atividade.all
      atividades_concluidas = []
       atividades.each do |atividade|
         if atividade.status == "Concluída"
           atividades_concluidas << atividade
         end
       end

      [atividades, atividades_concluidas]
    end
end
