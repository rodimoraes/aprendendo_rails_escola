class CreateSexos < ActiveRecord::Migration[6.0]
  def change
    create_table :sexos do |t|

      t.timestamps
    end
  end
end
