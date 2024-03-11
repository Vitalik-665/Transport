class Orderable < ApplicationRecord
  belongs_to :transport
  belongs_to :cart
  def total
    transport.price * quantity
  end
end
