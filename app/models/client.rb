class Client < ActiveRecord::Base

  has_one :address, dependent: :destroy

  paginates_per 10

  validates :name, presence: true
  validates :name, uniqueness: true

  def to_s
    name
  end

end
