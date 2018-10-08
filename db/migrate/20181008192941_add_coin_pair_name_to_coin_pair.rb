class AddCoinPairNameToCoinPair < ActiveRecord::Migration[5.2]
  def change
    add_column :coin_pairs, :coin_pair_name, :string
    add_index :coin_pairs, :coin_pair_name
  end
end
