class CreateCandles < ActiveRecord::Migration[5.2]
  def change
    create_table :candles do |t|
      t.string :coin_pair, index:true
      t.datetime :date
      t.integer :high
      t.integer :low
      t.integer :open
      t.integer :close
      t.integer :volume
      t.integer :quote_volume
      t.integer :weighted_avg

      t.timestamps
    end
  end
end
