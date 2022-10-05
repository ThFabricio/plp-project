class CreateLembretes < ActiveRecord::Migration[7.0]
  def change
    create_table :lembretes do |t|
      t.string :nome
      t.text :descricao
      t.datetime :dia

      t.timestamps
    end
  end
end
