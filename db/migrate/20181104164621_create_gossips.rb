class CreateGossips < ActiveRecord::Migration[5.2]
  def change
    create_table :gossips do |t|
      t.string :anonymous_gossip
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
