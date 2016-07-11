class Route < ActiveRecord::Base

  belongs_to :origin, :foreign_key => 'origin_id', :class_name => 'Point'
  belongs_to :destination,
    :foreign_key => 'destination_id',
    :class_name => 'Point'
  belongs_to :user

end
