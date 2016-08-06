class AddressForm < Reform::Form

  properties :street_number, :route, :locality, :administrative_area, :country, :postal_code, :coordinates, :user_id

  property :type, :virtual => true

  validates :street_number, :route, :locality, :administrative_area, :country, :postal_code, :user_id, :type, :presence => true

end
