class CreateLoads < ActiveRecord::Migration
  def self.up
    create_table :loads do |t|
      t.references :work
      t.string :P1
      t.string :P2
      t.string :P3
      t.string :P4
      t.string :P5    
      t.string :P6
      t.string :P7
      t.string :P8
      t.string :P9
      t.string :P10
      t.string :P11
      t.string :P12
      t.string :P13
      t.string :P14
      
      t.timestamps
    end
  end

  def self.down
    drop_table :loads
  end
end
