class SignupForm < UserForm

  properties :password, :password_confirmation

  validates :password, :password_confirmation,
    :presence => true,
    :length => {:minimum => 6}

  validate :password_confirmed



  protected

  def password_confirmed
    self.errors.add(:password) if self.password != self.password_confirmation
  end

end
