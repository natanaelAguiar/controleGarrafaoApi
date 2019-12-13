class JsonWebToken
    SECRET_KEY = Rails.application.credentials.jwt_pass

    def self.encode(payload)
        JWT.encode(payload, SECRET_KEY)
    end

    def self.decode(token)
        decode = JWT.decode(token, SECRET_KEY)[0]
        HashWithIndifferentAccess.new decode
    end
end