class CreateTarefas < ActiveRecord::Migration[7.0]
  def change
    create_table :tarefas do |t|
      t.string :nome
      t.text :descricao
      t.datetime :horaInicio
      t.datetime :horaFim
      t.boolean :status

      t.timestamps
    end


  end
end
