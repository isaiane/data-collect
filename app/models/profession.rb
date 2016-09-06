class Profession < ActiveRecord::Base
	include RankedModel
	has_many :records, dependent: :destroy
	ranks :row_order, :column => :row_order
	validates_presence_of :name
  validates_length_of :name, minimum: 3

  def append_to(type = nil)
    position = type ? Type.row_order + 1 : :first
    self.update_attribute :row_order_position, position
  end
end
