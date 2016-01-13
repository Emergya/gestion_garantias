class CreateContacts < ActiveRecord::Migration
  def change
    create_table :gg_contacts do |t|
    	t.column :gg_article_id, :integer
    	t.column :name, :string
    	t.column :phone, :string
    	t.column :email, :string
    	t.column :level, :integer
    end
  end

  def self.down
    drop_table :gg_contacts
  end
end