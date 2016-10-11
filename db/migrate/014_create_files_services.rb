class CreateFilesServices < ActiveRecord::Migration
  def self.up
    create_table :gg_files_services do |t|
      t.column :identity_file, :string
      t.column :code_file, :string
      t.column :key_file, :string
      t.column :name_provider, :string
      t.column :code_type_material, :string
      t.column :code_article, :string
      t.column :name_article, :string
      t.column :lot, :string
      t.column :code_file_services, :string
      t.column :date_guarantee, :date
    end
  end

  def self.down
    drop_table :gg_files_services
  end
end
