class PagesController < ApplicationController
  def home
    @atividades = Atividade.where(
      start_time: Time.now.beginning_of_year.beginning_of_month.beginning_of_week..Time.now.end_of_year.end_of_month.end_of_week
    )
    @lembretes = Lembrete.all
  end
end
