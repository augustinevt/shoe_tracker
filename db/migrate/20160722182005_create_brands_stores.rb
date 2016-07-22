class CreateBrandsStores < ActiveRecord::Migration
  def change
    create_table :brands_stores do |t|
      t.integer :store_id
      t.integer :brand_id
      t.timestamps()
    end
  end
end
