class Project < ActiveRecord::Base
  validates :technologies_used, presence: true
  validates :name, length: {in: 4..225}
  has_many :comments, as: :commentable
  mount_uploader :image, ImageUploaderUploader

  def image_name
    File.basename(image.path || image.filename) if image
  end
end
