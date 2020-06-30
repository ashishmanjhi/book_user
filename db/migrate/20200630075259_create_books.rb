class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :publisher
      t.string :year
      t.string :place
      t.text :description
      t.string :author

      t.timestamps
    end
  end
end
