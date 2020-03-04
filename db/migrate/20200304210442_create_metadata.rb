# frozen_string_literal: true

class CreateMetadata < ActiveRecord::Migration[5.2]
  def change
    create_table :metadata do |t|
      t.references :image, foreign_key: true
      t.string :width
      t.string :height

      t.timestamps
    end
  end
end
