class CreateCourses < ActiveRecord::Migration[7.2]
  def change
    create_table :courses do |t|
      t.string :title, null: false
      t.text :description
      t.string :department, null: false
      t.string :course_code
      t.string :status, default: 'active', null: false
      t.references :term, null: false, foreign_key: true
      t.references :instructor, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
