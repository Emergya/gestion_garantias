class AddIndexes < ActiveRecord::Migration
  def self.up
    add_index :gg_files, :code_file
    add_index :gg_files, :identity_file
    add_index :gg_articles, :code_article
    add_index :gg_articles, :code_provider
    add_index :gg_articles, :gg_file_id
    add_index :gg_materials, :date_guarantee
    add_index :gg_materials, :code_file
    add_index :gg_files_services, [:code_file, :key_file, :code_article, :code_type_material], :name => 'files_services_multi_index'
    add_index :gg_files_services, :code_file_services
  end

  def self.down
    remove_index :gg_files, :code_file
    remove_index :gg_files, :identity_file
    remove_index :gg_articles, :code_article
    remove_index :gg_articles, :code_provider
    remove_index :gg_articles, :gg_file_id
    remove_index :gg_materials, :date_guarantee
    remove_index :gg_materials, :code_file
    remove_index :gg_files_services, :name => 'files_services_multi_index'
    remove_index :gg_files_services, :code_file_services
  end
end