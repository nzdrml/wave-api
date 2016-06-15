class AccessGenerator

  def generate_access identifier
    raise 'Identifier is required' if identifier.nil?

    Access.new(
      :access_token => TokenGenerator.new.generate(identifier),
      :remember_token => TokenGenerator.new.generate(identifier)
    )
  end

end
