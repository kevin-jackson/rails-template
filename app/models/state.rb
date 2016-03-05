class State < ActiveRecord::Base

  # Soft delete - uses deleted_at field
  acts_as_paranoid

  validates :name, presence: true, uniqueness: true
  validates :abbreviation, presence: true, uniqueness: true

  def to_s
    name
  end

end
