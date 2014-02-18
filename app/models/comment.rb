class Comment < ActiveRecord::Base
  # attr_accessible :content
  belongs_to :commentable, polymorphic: true

  scope :approved, -> { where(approved: true) }
  scope :unapproved, -> { where(approved: false) }

  def approve!
    approved = true
    save
  end

  def approved?
    approved
  end
end
