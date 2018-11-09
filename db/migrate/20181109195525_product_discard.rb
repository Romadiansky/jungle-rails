class ProductDiscard < ActiveRecord::Migration
  def change
    add_column :products, :discarded_at, :datetime
  end
end
