class CreateTarefas < ActiveRecord::Migration[7.0]
  def change
    create_table :tarefas do |t|
      t.string :nome
      t.text :descricao
      t.time :horario
      t.string :status
      t.date :data

      t.timestamps
    end
  end
end
