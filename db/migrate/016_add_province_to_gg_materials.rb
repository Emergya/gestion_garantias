class AddProvinceToGgMaterials < ActiveRecord::Migration
  def self.up
    add_column :gg_materials, :province, :string
  end

  def self.down
    remove_column :gg_materials, :province
  end
end