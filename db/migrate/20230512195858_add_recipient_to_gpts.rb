class AddRecipientToGpts < ActiveRecord::Migration[6.1]
  def change
    add_column :gpts, :recipient_id, :integer
  end
end
