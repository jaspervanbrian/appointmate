class CreateStaffs < ActiveRecord::Migration[7.1]
  def change
    create_table :staffs do |t|
      t.string :first_name
      t.string :last_name
      t.string :schedule
      t.string :title

      t.timestamps
    end
  end
end
