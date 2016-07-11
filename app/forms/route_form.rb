class RouteForm < Reform::Form

  properties :origin_id, :destination_id, :time, :price

  validates :origin_id, :destination_id, :time, :price, :presence => true

end
