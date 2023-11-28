class CreateDeliveryCostIds < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_cost_ids do |t|

      t.timestamps
    end
  end
end
