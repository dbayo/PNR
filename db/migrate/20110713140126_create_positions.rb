class CreatePositions < ActiveRecord::Migration
  def self.up
    create_table :positions do |t|
      t.references :work
      t.string :letras
      t.integer :numeros
      t.integer :tren
      t.integer :posicion
      t.integer :peso
      t.string :volumen

      t.timestamps
    end
  end

  def self.down
    drop_table :positions
  end
end
