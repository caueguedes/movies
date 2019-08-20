require 'httparty'
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE


class Swapi
    include HTTParty
    format :json

    base_uri 'swapi.co'

    def self.fetchAll
        get('/api/films/')
    end 

    def self.fetch(id)
        get("/api/films/#{id}/")
    end
end