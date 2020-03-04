# frozen_string_literal: true

class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.text :description
      t.string :owner
      t.text :path
      t.string :slug

      t.timestamps
    end
  end
end
