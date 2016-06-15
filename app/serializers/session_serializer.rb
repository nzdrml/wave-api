class SessionSerializer < ActiveModel::Serializer

  TOKEN_TYPE = 'Bearer'
  DELIMITER = ':'


  attributes :id, :email, :token_type, :access_token

  def id
    object.user.id
  end

  def email
    object.user.email
  end

  def token_type
    TOKEN_TYPE
  end

end
