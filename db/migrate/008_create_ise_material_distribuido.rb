class CreateIseMaterialDistribuido < ActiveRecord::Migration
  def self.up
    create_table :ISE_MATERIAL_DISTRIBUIDO_GAR do |t|
      t.column :CODIGO_CENTRO, :string
      t.column :CENTRO, :string
      t.column :SEDE, :string
      t.column :LOCALIDAD, :string
      t.column :CODIGO_TIPO_MATERIAL, :string
      t.column :TIPO_MATERIAL, :string
      t.column :CODIGO_ARTICULO, :string
      t.column :ARTICULO, :string
      t.column :CODIGO_PROVEEDOR, :string
      t.column :PROVEEDOR, :string
      t.column :CODIGO_EXPEDIENTE, :string
      t.column :ADJ, :string
      t.column :LOTE, :string
      t.column :CODIGO_ACTUACION, :string
      t.column :ACTUACION, :string
      t.column :FECHA_ENTREGA, :datetime
      t.column :NUMERO_ORDEN, :string
      t.column :FECHA_GARANTIA, :datetime
      t.column :FECHA_ORDEN, :datetime
      t.column :NUMERO_SERIE, :string
      t.column :APARATO, :string
    end
  end

  def self.down
    drop_table :ISE_MATERIAL_DISTRIBUIDO_GAR
  end
end
