class CreateLembretes < ActiveRecord::Migration[7.0]
  def change
    create_table :lembretes do |t|
      t.text :descricao
      t.date :data
      t.time :horario

      t.timestamps
    end
  end
end
