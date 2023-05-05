class CreateGigs < ActiveRecord::Migration[6.1]
  def change
    create_table :gigs do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true
      t.references :agent, foreign_key: true
      t.string :description
      t.string :industry

      t.timestamps
    end
  end
end
