class ServiceItem < ApplicationRecord
  belongs_to :invoice

  scope :internets, -> { where(type: "Item::Internet") }
  scope :parking_fees, -> { where(type: "Item::ParkingFee") }
  scope :services, -> { where(type: "Item::Service") }

  def self.type
    %w[Item::Internet Item::ParkingFee Item::Service]
  end
end
