class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :occurs_on
      t.belongs_to :meetup, index: true
      t.belongs_to :source, index: true

      t.timestamps
    end
  end
end
