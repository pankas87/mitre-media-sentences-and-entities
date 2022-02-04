class CreateEntities < ActiveRecord::Migration[6.1]
  def change
    create_table :entities do |t|
      t.text :text
      t.string :type_of
      t.references :sentence, null: false, foreign_key: true

      t.timestamps
    end
  end
end
