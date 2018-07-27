class CreateDocsAndSpecs < ActiveRecord::Migration[5.2]
  def change
    create_table :docs_and_specs do |t|
      t.references :doctor, foreign_key: true
      t.references :specialty, foreign_key: true

      t.timestamps
    end
  end
end
