class CreateJuiceProduce < ActiveRecord::Migration[5.0]
  def change
    create_table :juice_produce do |t|
      t.integer :quantity
      t.belongs_to :produce, foreign_key: true
      t.belongs_to :juice, foreign_key: true

      t.timestamps
    end
  end
end
