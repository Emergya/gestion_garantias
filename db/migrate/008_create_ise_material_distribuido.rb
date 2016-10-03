class CreateIseMaterialDistribuido < ActiveRecord::Migration
  def self.up
    create_table :gg_materials do |t|
      t.column :code_center, :string
      t.column :center, :string
      t.column :headquarters, :string
      t.column :location, :string
      t.column :code_type_material, :string
      t.column :type_material, :string
      t.column :code_article, :string
      t.column :article, :string
      t.column :code_provider, :string
      t.column :provider, :string
      t.column :code_file, :string
      t.column :adj, :string
      t.column :lot, :string
      t.column :code_action, :string
      t.column :action, :string
      t.column :date_deliver, :date
      t.column :order_number, :string
      t.column :date_guarantee, :date
      t.column :date_order, :date
      t.column :serial_number, :string
      t.column :device, :string
    end
  end

  def self.down
    drop_table :gg_materials
  end
end
