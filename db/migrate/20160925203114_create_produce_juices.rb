class CreateProduceJuices < ActiveRecord::Migration[5.0]
  def change
    create_table :produce_juices do |t|
      t.integer :quantity
      t.belongs_to :produce_id, foreign_key: true
      t.belongs_to :juice_id, foreign_key: true

      t.timestamps
    end
  end
end
