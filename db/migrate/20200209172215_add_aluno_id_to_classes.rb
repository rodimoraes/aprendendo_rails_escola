class AddAlunoIdToClasses < ActiveRecord::Migration[6.0]
  def change
    add_column :classes, :aluno_id, :integer
  end
end
