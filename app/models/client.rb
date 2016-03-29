class Client < ActiveRecord::Base

  belongs_to :address, dependent: :destroy

  paginates_per 10

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :address, presence: true

  accepts_nested_attributes_for :address

  def to_s
    name
  end

end
