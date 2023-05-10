class CreateGpts < ActiveRecord::Migration[6.1]
  def change
    create_table :gpts do |t|
      t.string :content
      t.string :role
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
