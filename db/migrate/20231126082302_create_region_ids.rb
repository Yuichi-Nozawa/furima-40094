class CreateRegionIds < ActiveRecord::Migration[7.0]
  def change
    create_table :region_ids do |t|

      t.timestamps
    end
  end
end
