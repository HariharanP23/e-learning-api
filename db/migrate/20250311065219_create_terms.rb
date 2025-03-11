class CreateTerms < ActiveRecord::Migration[7.2]
  def change
    create_table :terms do |t|
      t.string :name, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false

      t.timestamps
    end
    add_index :terms, :name, unique: true
  end
end
