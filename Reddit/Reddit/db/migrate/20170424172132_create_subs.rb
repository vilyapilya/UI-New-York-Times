class CreateSubs < ActiveRecord::Migration[5.0]
  def change
    create_table :subs do |t|
      t.string :title
      t.string :description
      t.integer :user_ids

      t.timestamps
    end
  end
end
