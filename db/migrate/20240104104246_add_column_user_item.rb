class AddColumnUserItem < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders,  :user,  foreign_key: true
    add_reference :orders,  :item,  foreign_key: true
  end
end


# t.references :user, null: false, foreign_key: true
# t.references :item, null: false, foreign_key: true