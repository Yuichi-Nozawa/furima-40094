class CreateStatusIds < ActiveRecord::Migration[7.0]
  def change
    create_table :status_ids do |t|

      t.timestamps
    end
  end
end
