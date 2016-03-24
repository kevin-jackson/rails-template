class Address < ActiveRecord::Base

  belongs_to :client

  validates :line_1, presence: true
  validates :state, presence: true
  validates :city, presence: true
  validates :post_code, presence: true

  def to_s
    "#{line_1}, #{line_2}, #{suburb}, #{city}, #{state}, #{post_code}"
  end

end
