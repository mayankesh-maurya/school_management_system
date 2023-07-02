class CreateBatches < ActiveRecord::Migration[5.2]
  def change
    create_table :batches do |t|
      t.string :name
      t.text :description
      t.belongs_to :school, foreign_key: true
      t.belongs_to :course, foreign_key: true

      t.timestamps
    end
  end
end
