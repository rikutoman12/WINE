class CreateWines < ActiveRecord::Migration[5.2]
  def change
    create_table :wines do |t|

      t.text :colour
      t.text :comment
      t.text :age
      t.text :origin
      t.text :scent
      t.text :taste
      t.text :kinds
      t.string :image_id
      t.timestamps
      t.timestamps
    end
  end
end
