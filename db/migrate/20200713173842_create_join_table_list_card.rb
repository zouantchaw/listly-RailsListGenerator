class CreateJoinTableListCard < ActiveRecord::Migration[6.0]
  def change
    create_join_table :lists, :cards do |t|
       t.index [:list_id, :card_id]
       t.index [:card_id, :list_id]
    end
  end
end
