class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :agent, null: false, foreign_key: true
      t.string :content
      t.string :subject
      t.boolean :read_receipt_user, default: false
      t.boolean :read_receipt_manager, default: false
      t.string :reaction_user
      t.string :reaction_manager

      t.timestamps
    end
  end
end
