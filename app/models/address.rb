class Address < ActiveRecord::Base

  has_one :client

  validates :line_1, presence: true, length: { maximum: 200 }
  validates :line_2, length: { maximum: 200 }
  validates :suburb, length: { maximum: 100 }
  validates :city, presence: true, length: { maximum: 100}
  validates :state, presence: true, length: { maximum: 100 }
  validates :post_code, presence: true, length: { maximum: 10 }

  def to_s
    "#{line_1}, #{line_2}, #{suburb}, #{city}, #{state}, #{post_code}"
  end

end
