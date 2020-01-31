class CreateAlunos < ActiveRecord::Migration[6.0]
  def change
    create_table :alunos do |t|
      t.string :nome
      t.string :classe
      t.string :endereco
      t.date :data_nasc
      t.float :b1d
      t.float :b2
      t.float :media
      t.timestamps
    end
  end
end
