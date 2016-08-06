class PointUser < ActiveRecord::Base

  enum :point_type => [:pickup, :dropoff]

  belongs_to :point
  belongs_to :user

end
