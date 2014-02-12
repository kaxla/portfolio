class Comment < ActiveRecord::Base
  belongs_to :post

  scope :approved, where(approved: true)
  scope :unapproved, where(approved: false)

  def approve!
    approved = true
    save
  end

  def approved?
    approved
  end
end
