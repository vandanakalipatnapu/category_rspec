class AlterColumnPostsDescription < ActiveRecord::Migration
  def change

  end

   def self.up
    change_table :posts do |t|
      t.change :description, :text
    end
  end

   def self.down
    change_table :posts do |t|
      t.change :description, :string
    end
  end
end
