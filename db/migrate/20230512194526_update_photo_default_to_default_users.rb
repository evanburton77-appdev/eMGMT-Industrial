class UpdatePhotoDefaultToDefaultUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :photo, from: nil, to: "https://i.pinimg.com/originals/f1/0f/f7/f10ff70a7155e5ab666bcdd1b45b726d.jpg"
  end
end
