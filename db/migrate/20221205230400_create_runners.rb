class CreateRunners < ActiveRecord::Migration[7.0]
  def change
    create_table :runners do |t|
      t.references :reading, null: false, foreign_key: true

      t.timestamps
    end
  end
end
