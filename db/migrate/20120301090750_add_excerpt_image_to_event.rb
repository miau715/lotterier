class AddExcerptImageToEvent < ActiveRecord::Migration
  def change
    add_column :events, :excerpt_image_file_name,	:string 
    add_column :events, :excerpt_image_content_type, :string 
    add_column :events, :excerpt_image_file_size,	:integer 
    add_column :events, :excerpt_image_updated_at, :datetime
  end
end
