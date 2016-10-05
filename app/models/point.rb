class Point < ActiveRecord::Base

  has_many :point_users, :dependent => :destroy
  has_many :users, :through => :point_users


  TYPES = ['pickup', 'dropoff']

end
