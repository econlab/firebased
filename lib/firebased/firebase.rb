require 'faraday'
require 'json'

FIRE_BASE = 'https://admin.firebase.com/firebase'

module Firebased
  class Firebase
    attr_accessor :name, :personal_token, :admin_token, :firebase_token, :auth_tokens
    
    def initialize(name, admin_token)
      @name        = name
      @admin_token = admin_token
      generate_reference!
    end
    
    
    def auth_tokens
      return @auth_tokens || get_auth_tokens
    end
    
    
    private
    
    def generate_reference!
      params     = { token: @admin_token, namespace: @name }
      response   = Faraday.get("#{FIRE_BASE}/#{name}/token", params)
      attributes = JSON.parse(response.body)
      @personal_token = attributes["personalToken"]
      @firebase_token = attributes["firebaseToken"]
    end
    
  end
end