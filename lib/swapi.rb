require 'httparty'
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class Swapi
    include HTTParty
    :json

    read_timeout 10

    base_uri 'swapi.co'
    
    def self.fetchAll
        get('/api/films/')
    end 

    def self.fetchDetail(detail)
        get('/api/films/'+ detail +'/')
    end
end