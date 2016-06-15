class TokenGenerator

  DELIMITER = ':'


  def generate identifier
    raise 'Identifier is required' if identifier.nil?

    [identifier, Devise.friendly_token].join DELIMITER
  end

end
