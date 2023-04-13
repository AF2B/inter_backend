require 'jwt'

module JWTWrapper
  def self.encode(payload)
    JWT.encode(payload, nil)
  end

  def self.decode(token)
    JWT.decode(token, nil, false)
  end

  def self.valid_token?(token)
    begin
      decode(token)
    rescue JWT::DecodeError
      false
    end
  end
end
