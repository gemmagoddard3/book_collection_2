class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title, null: false           
      t.string :author, null: false          
      t.date :published_date, null: false    
      t.decimal :price, null: false

      t.timestamps
    end
  end
end