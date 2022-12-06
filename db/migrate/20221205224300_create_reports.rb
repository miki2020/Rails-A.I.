class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.string :test_data
      t.string :predict
      t.references :reading, null: false, foreign_key: true

      t.timestamps
    end
  end
end
