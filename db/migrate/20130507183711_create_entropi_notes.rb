class CreateEntropiNotes < ActiveRecord::Migration
  def change
    create_table :entropi_notes do |t|
      t.string :title
      t.text :body
      t.noteable :references
      t.user :references

      t.timestamps
    end
  end
end
