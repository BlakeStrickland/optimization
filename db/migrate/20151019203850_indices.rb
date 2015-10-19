class Indices < ActiveRecord::Migration
  def change
    add_index :sequences, :assembly_id
    add_index :hits, :subject_id
    add_index :genes, :sequence_id
  end
end
