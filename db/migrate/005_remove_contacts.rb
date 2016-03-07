class RemoveContacts < ActiveRecord::Migration
  def self.up
    drop_table :gg_contacts
  end

  def self.down
    create_table :gg_contacts do |t|
    	t.column :gg_article_id, :integer
    	t.column :name, :string
    	t.column :phone, :string
    	t.column :email, :string
    	t.column :level, :integer
    end
  end
end