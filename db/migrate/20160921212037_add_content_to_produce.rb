class AddContentToProduce < ActiveRecord::Migration[5.0]
  def change
    add_column :produce, :content, :text
  end
end
