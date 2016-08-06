class Address < ActiveRecord::Base

  belongs_to :user

  TYPES = ['home', 'work']

end
