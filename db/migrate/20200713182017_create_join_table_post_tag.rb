class CreateJoinTablePostTag < ActiveRecord::Migration[6.0]
  def change
    create_join_table :lists, :tags do |t|
       t.index [:list_id, :tag_id]
       t.index [:tag_id, :list_id]
    end
  end
end
