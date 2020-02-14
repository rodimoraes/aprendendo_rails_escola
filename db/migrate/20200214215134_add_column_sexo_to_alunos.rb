class AddColumnSexoToAlunos < ActiveRecord::Migration[6.0]
  def change
    add_column :alunos, :sexo, :string
  end
end
