class AddEndTimeToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :end_time, :datetime
  end
end
