json.extract! atividade, :id, :nome, :descricao, :start_time, :end_time, :created_at, :updated_at
json.url atividade_url(atividade, format: :json)
