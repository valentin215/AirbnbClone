class ChangeNameColumnTitleToDescription < ActiveRecord::Migration[5.2]
  def change
    rename_column :flats, :title, :description
  end
end
