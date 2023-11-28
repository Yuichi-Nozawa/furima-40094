class CreateDeliveryDayIds < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_day_ids do |t|

      t.timestamps
    end
  end
end
