class AddAttachmentFotoToAlunos < ActiveRecord::Migration[5.1]
  def self.up
    change_table :alunos do |t|
      t.attachment :foto
    end
  end

  def self.down
    remove_attachment :alunos, :foto
  end
end
