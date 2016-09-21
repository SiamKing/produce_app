class AddColumnToProduce < ActiveRecord::Migration[5.0]
  def change
    add_column :produce, :expires_in, :integer
  end
end
