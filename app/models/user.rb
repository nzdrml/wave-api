class User < ActiveRecord::Base

  attr_accessor :login

  devise :database_authenticatable, :recoverable,
    :rememberable, :trackable


  has_many :accesses, :dependent => :destroy


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
