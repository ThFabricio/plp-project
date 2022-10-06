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
    @atividades = Atividade.all
    @metas = Metum.all
    @res_semanal = {}
    @res_mensal = {}

    # semanal
    @atividades.each do |at|
      if at.status == "Concluída"
        if @res_semanal.has_key?(at.start_time.to_date.cweek)
          @res_semanal[at.start_time.to_date.cweek] += 1
        else
          @res_semanal[at.start_time.to_date.cweek] = 1
        end
      end
    end

    @metas.each do |meta|
      if meta.status == "Concluída" && meta.frequencia == "Semanal"
        if @res_semanal.has_key?(meta.start_time.to_date)
          @res_semanal[meta.start_time.to_date.cweek] += 1
        else
          @res_semanal[meta.start_time.to_date.cweek] = 1
        end
      end
    end

    @res_semanal.sort_by {|k, v| v}

    # mensal
    @atividades.each do |at|
      if at.status == "Concluída"
        if @res_mensal.has_key?(at.start_time.to_date.month)
          @res_mensal[at.start_time.to_date.month] += 1
        else
          @res_mensal[at.start_time.to_date.month] = 1
        end
      end
    end

    @metas.each do |meta|
      if meta.status == "Concluída" && meta.frequencia == "Semanal"
        if @res_mensal.has_key?(meta.start_time.to_date)
          @res_mensal[meta.start_time.to_date.month] += 1
        else
          @res_mensal[meta.start_time.to_date.month] = 1
        end
      end
    end

    @res_mensal.sort_by {|k, v| v}
  end

  def relatorio4
    @atividades = Atividade.all
    @manha = []
    @tarde = []
    @noite = []
    @madrugada = []

    @atividades.each do |atividade|
      if atividade.status == "Concluída"
        if atividade.start_time.hour >= DateTime.new(2022, 10, 6, 6, 0, 0).hour && atividade.end_time.hour <= DateTime.new(2022, 10, 6, 12, 0, 0).hour
          @manha << atividade
        elsif atividade.start_time.hour >= DateTime.new(2022, 10, 6, 12, 0, 0).hour && atividade.end_time.hour <= DateTime.new(2022, 10, 6, 18, 0, 0).hour
          @tarde << atividade
        elsif atividade.start_time.hour >= DateTime.new(2022, 10, 6, 18, 0, 0).hour && atividade.end_time.hour <= DateTime.new(2022, 10, 6, 23, 59, 0).hour
          @noite << atividade
        elsif atividade.start_time.hour >= DateTime.new(2022, 10, 6, 0, 0, 0).hour && atividade.end_time.hour <= DateTime.new(2022, 10, 6, 6, 0, 0).hour
          @madrugada << atividade
        end
      end
      @resultado = {
        "manhã" => @manha.length,
        "tarde" => @tarde.length,
        "noite" => @noite.length,
        "madrugada" => @madrugada.length,
      }
      @resultado.sort_by {|k, v| v}
    end
  end

  def relatorio5
    atividades, atividades_concluidas = pegar_atividades_concluidas
    @qtd_atividades_por_categoria = {}
    atividades_concluidas.each do |atividade|
      if atividade.categoriums.all[0] != nil
        categoria = atividade.categoriums.all[0]
        if @qtd_atividades_por_categoria.has_key?(categoria.nome)
          @qtd_atividades_por_categoria[categoria.nome] += 1
        else
          @qtd_atividades_por_categoria[categoria.nome] = 1
        end
      end
    end

    @qtd_atividades_por_categoria.sort_by {|k, v| v}
  end

  def relatorio6
    metas, metas_concluidas = pegar_metas_concluidas
    @qtd_metas_por_categoria = {}
    metas_concluidas.each do |meta|
      if meta.categoriums.all[0] != nil
        categoria = meta.categoriums.all[0]
        if @qtd_metas_por_categoria.has_key?(categoria.nome)
          @qtd_metas_por_categoria[categoria.nome] += 1
        else
          @qtd_metas_por_categoria[categoria.nome] = 1
        end
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
