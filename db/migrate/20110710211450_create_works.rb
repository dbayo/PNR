class CreateWorks < ActiveRecord::Migration
  def self.up
    create_table :works do |t|
      t.string :plane
      
      t.string :T1P1
      t.string :T1P2
      t.string :T1P3
      t.string :T1P4
      t.string :T1P5
      
      t.string :T2P1
      t.string :T2P2
      t.string :T2P3
      t.string :T2P4
      t.string :T2P5
      
      t.string :T3P1
      t.string :T3P2
      t.string :T3P3
      t.string :T3P4
      t.string :T3P5
      
      t.string :T4P1
      t.string :T4P2
      t.string :T4P3
      t.string :T4P4
      t.string :T4P5
      
      t.string :T5P1
      t.string :T5P2
      t.string :T5P3
      t.string :T5P4
      t.string :T5P5
      
      t.timestamps
    end
  end

  def self.down
    drop_table :works
  end
end
