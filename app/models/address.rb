class Address < ActiveRecord::Base

  # Soft delete - uses deleted_at field
  acts_as_paranoid

  belongs_to :state

  validates :line_1, presence: true
  validates :suburb, presence: true
  validates :postal_code, presence: true
  validates :state, presence: true

  def to_s
    line_1
  end

end
