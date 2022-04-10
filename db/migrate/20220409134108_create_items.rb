class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :menu
      t.string :category
      t.string :comment
      t.string :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end