class CreateMeta < ActiveRecord::Migration[7.0]
  def change
    create_table :meta do |t|
      t.string :nome
      t.text :descricao
      t.string :frequencia
      t.string :status

      t.timestamps
    end
  end
end
