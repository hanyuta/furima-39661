class CreateBoughtRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :bought_records do |t|

      t.timestamps
    end
  end
end
