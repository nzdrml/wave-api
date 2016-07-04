class UserForm < Reform::Form

  properties :first_name, :last_name, :email

  validates :first_name, :last_name, :email, :phone, :company, :presence => true
  validates_uniqueness_of :email

end
