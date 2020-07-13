class CreateJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :cards, :lists do |t|
       t.index :card_id
       t.index :list_id 
    end
  end
end
