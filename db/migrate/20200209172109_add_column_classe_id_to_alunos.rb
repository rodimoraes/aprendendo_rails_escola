class AddColumnClasseIdToAlunos < ActiveRecord::Migration[6.0]
  def change
    add_column :alunos, :classe_id, :integer
  end
end
