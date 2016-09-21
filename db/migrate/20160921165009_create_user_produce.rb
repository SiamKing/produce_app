class CreateUserProduce < ActiveRecord::Migration[5.0]
  def change
    create_table :user_produce do |t|
      t.belongs_to :user, index: true
      t.belongs_to :produce, index: true
      t.integer :quantity
      t.boolean :eaten?, default: false

      t.timestamps
    end
  end
end
