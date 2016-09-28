class ChangeDefaultToKindProduce < ActiveRecord::Migration[5.0]
  def change
    change_column :produce, :kind, :string, :default => "fruit"
  end
end
