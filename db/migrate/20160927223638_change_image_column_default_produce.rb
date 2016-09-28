class ChangeImageColumnDefaultProduce < ActiveRecord::Migration[5.0]
  def change
    change_column :produce, :image, :string, :default => 'app/assets/images/No_image_available.svg.png'
  end
end
