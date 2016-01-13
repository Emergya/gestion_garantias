class CreateFiles < ActiveRecord::Migration
  def change
    create_table :gg_files do |t|
        t.column :identity_file, :integer
        t.column :code_file, :string
    end
  end

  def self.down
    drop_table :gg_files
  end
end
