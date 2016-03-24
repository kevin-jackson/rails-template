class Client < ActiveRecord::Base

  has_one :address, dependent: :destroy

  paginates_per 10

  validates :name, presence: true
  validates :name, uniqueness: true

  scope :name_search, -> (name) { where("name ILIKE ?", "%#{name}%") }

  def to_s
    name
  end

end
