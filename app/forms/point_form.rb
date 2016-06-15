class PointForm < Reform::Form

  properties :name, :coordinates

  validates :name, :presence => true

end
