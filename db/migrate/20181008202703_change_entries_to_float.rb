class ChangeEntriesToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :candles, :high, :float
    change_column :candles, :low, :float
    change_column :candles, :open, :float
    change_column :candles, :close, :float
    change_column :candles, :volume, :float
    remove_column :candles, :quote_volume
    remove_column :candles, :weighted_avg

  end
end
