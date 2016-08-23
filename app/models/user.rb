class User < ActiveRecord::Base

  attr_accessor :login

  devise :database_authenticatable, :recoverable,
    :rememberable, :trackable

  has_many :accesses, :dependent => :destroy
  has_many :bookings

  has_many :point_users, :dependent => :destroy
  has_many :points, :through => :point_users

  has_one :pickup_type, -> { pickup }, :class_name => 'PointUser'
  has_one :preferred_pickup_point, :through => :pickup_type, :source => :point

  has_one :dropoff_type, -> { dropoff }, :class_name => 'PointUser'
  has_one :preferred_dropoff_point,
            :through => :dropoff_type,
            :source => :point

  has_one :home_address, :class_name => 'Address'
  has_one :work_address, :class_name => 'Address'
  

  def self.find_for_database_authentication warden_conditions
    conditions = warden_conditions.dup

    if login = conditions.delete(:login)
      where(conditions.to_hash).
        where(:email => login).
          first
    else
      where(conditions.to_hash).first
    end
  end

end
