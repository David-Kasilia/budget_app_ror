class AddEntityReferenceToGroup < ActiveRecord::Migration[7.0]
  def change
    add_reference :groups, :entity, null: false, foreign_key:{to_table: :entities}
  end
end
