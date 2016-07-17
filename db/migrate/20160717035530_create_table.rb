class CreateTable < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.string :time
      t.string :count
    end
  end
end
