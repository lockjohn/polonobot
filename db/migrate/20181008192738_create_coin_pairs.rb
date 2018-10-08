class CreateCoinPairs < ActiveRecord::Migration[5.2]
  def change
    create_table :coin_pairs do |t|

      t.timestamps
    end
  end
end
