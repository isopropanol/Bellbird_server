class CreateAlarms < ActiveRecord::Migration[5.0]
  def change
    create_table :alarms do |t|
      t.text :description

      t.timestamps
    end

    add_index :alarms, :created_at
  end
end
