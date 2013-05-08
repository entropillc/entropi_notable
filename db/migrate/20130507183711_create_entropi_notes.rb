class CreateEntropiNotes < ActiveRecord::Migration
  def self.up
    create_table :entropi_notes do |t|
      t.string      :title,     limit: 100,     default: "" 
      t.text        :body,      null: false
      t.references  :notable,  polymorphic: true
      t.references  :user,      null: false

      t.timestamps
    end

    add_index :entropi_notes, :notable_type
    add_index :entropi_notes, :notable_id
    add_index :entropi_notes, :user_id
  end

  def down
    drop_table :entropi_notes
  end
end
