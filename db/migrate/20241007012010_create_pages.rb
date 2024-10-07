class CreatePages < ActiveRecord::Migration[7.2]
  def change
    create_table :pages do |t|
      t.string :topic
      t.jsonb :json_data  # JSON field to store the data from OpenAI
      t.string :image_url
      t.text :html_content
      t.integer :day_index
      t.timestamps
    end
  end
end
