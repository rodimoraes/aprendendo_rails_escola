class AddStatus1ToAlunos < ActiveRecord::Migration[6.0]
  def change
    add_column :alunos, :status,:string 
  end
end
