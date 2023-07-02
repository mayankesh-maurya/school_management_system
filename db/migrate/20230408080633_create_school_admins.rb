class CreateSchoolAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :school_admins do |t|
      t.string :name
      t.belongs_to :school, foreign_key: true

      t.timestamps
    end
  end
end
