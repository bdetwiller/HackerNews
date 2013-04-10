class CreateAncestries < ActiveRecord::Migration
  def change
    create_table :ancestries do |t|
      t.references :ancestor
      t.references :descendant

      t.timestamps
    end
    add_index :ancestries, :ancestor_id
    add_index :ancestries, :descendant_id
  end
end
