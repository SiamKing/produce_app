class CreateProduce < ActiveRecord::Migration[5.0]
  def change
    create_table :produce do |t|
      t.string :name
      t.string :image
      t.string :kind

      t.timestamps
    end
  end
end
