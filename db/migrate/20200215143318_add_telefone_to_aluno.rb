class AddTelefoneToAluno < ActiveRecord::Migration[6.0]
  def change
    add_column :alunos, :telefone, :string, limit:   11
  end
end
