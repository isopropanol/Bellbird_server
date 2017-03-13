class CreateUpvotes < ActiveRecord::Migration[5.0]
  def change
    create_table :upvotes do |t|

      t.timestamps
    end
    add_reference :upvotes, :alarm, index: true, foreign_key: true
  end
end