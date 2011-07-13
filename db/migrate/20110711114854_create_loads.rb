class CreateLoads < ActiveRecord::Migration
  def self.up
    create_table :loads do |t|
      t.references :work
      t.string :A
      t.string :B
      t.string :C
      t.string :D
      t.string :E     
      t.string :F
      t.string :G
      t.string :H
      t.string :I
      t.string :J
      t.string :K
      t.string :L
      t.string :M
      t.string :N
      
      t.timestamps
    end
  end

  def self.down
    drop_table :loads
  end
end
