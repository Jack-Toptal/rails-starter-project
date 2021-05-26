class Question < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  has_many :answers, dependent: :destroy

  validates :user, :title, :description, presence: true

  def editable_by?(actor)
    actor == user
  end

  def deletable_by?(actor)
    actor == user
  end
end
