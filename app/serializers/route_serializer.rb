class RouteSerializer < ActiveModel::Serializer

  TOKEN_TYPE = 'Bearer'
  DELIMITER = ':'


  attributes :id, :origin_id, :origin, :origin_coordinates, :destination_id, :destination, :destination_coordinates, :price, :time, :meridiem

  def origin
    object.origin.name
  end

  def origin_coordinates
    object.origin.coordinates
  end

  def destination
    object.destination.name
  end

  def destination_coordinates
    object.destination.coordinates
  end

  def meridiem
    object.time.strftime '%p'
  end

end
