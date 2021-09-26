class CreateAuctions < ActiveRecord::Migration[6.1]
  def change
    create_table :auctions do |t|
      t.datetime :started_at
      t.integer :status
      t.references :winner, foreign_key: { to_table: :users }, null: true
      t.references :product

      t.timestamps
    end
  end
end
