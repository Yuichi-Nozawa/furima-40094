class CreateCategoryIds < ActiveRecord::Migration[7.0]
  def change
    create_table :category_ids do |t|

      t.timestamps
    end
  end
end
