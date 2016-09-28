class ChangeImageColumnProduce < ActiveRecord::Migration[5.0]
  def up
    change_column_default :produce, :image, nil
  end

  def down
    change_column_default :produce, :image, :string, default: "app/assets/images/No_image_available.svg.png"
  end
end
