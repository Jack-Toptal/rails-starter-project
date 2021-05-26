class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.string :slug, null: false, index: { unique: true }
      t.text :description, null: false
      t.string :tags
      t.integer :views, default: 0, null: false

      t.timestamps
    end
  end
end
