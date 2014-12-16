require 'faraday'
require 'json'

ACCOUNT_BASE = 'https://admin.firebase.com/account'
FIRE_BASE    = 'https://admin.firebase.com/firebase'

module Firebased
  class Account
    attr_reader :email, :pass, :token, :bases
    
    def initialize(email, pass, token = nil)
      @email = email
      @pass  = pass
      @token = token
      @bases = {}
      login! unless token
    end
    
    
    # Fetches admin token if not passed on initialize
    def login!
      params     = { email: email, password: pass }
      response   = Faraday.get("#{ACCOUNT_BASE}/login", params)
      attributes = JSON.parse(response.body)
      @token     = attributes["adminToken"]
    end
    
    
    # Create a new firebase
    #
    # @param name     [String] slug/url-friendly app name
    # @param app_name [String] title of firebase
    #
    # @return         [Firebased::Firebase] a fresh new Firebase instance
    def create_firebase(name, app_name = nil)
      params   = { token: @token, appName: app_name || name }
      response = Faraday.post("#{FIRE_BASE}/#{name}", params)
      response = JSON.parse(response.body)
      firebase = Firebased::Firebase.new(name, @token) if response["success"]
      @bases[name] = firebase
      return firebase
    end
    
    
    # Fetch an existing firebase
    #
    # @param name     [String] slug/url-friendly app name
    #
    # @return         [Firebased::Firebase] a fresh new Firebase instance
    def get_firebase(name)
      @bases[name] || Firebased::Firebase.new(name, @token)
    end
    
    
    # Delete an existing firebase
    #
    # @param name     [String] slug/url-friendly app name
    #
    # @return         [Firebased::Firebase] a fresh new Firebase instance
    def delete_firebase(name)
      params   = { "_method" => "DELETE", namespace: name, token: @token }
      response = Faraday.post("#{FIRE_BASE}/#{name}", params)
      response = JSON.parse(response.body)
      p response["error"]
      @bases.delete(name) unless response["error"]
    end
    
  end
end