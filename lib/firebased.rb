require_relative 'firebased/version'

require_relative 'firebased/account'
require_relative 'firebased/firebase'
require_relative 'firebased/configurable'

module Firebased
  class << self
    include Firebased::Configurable
    
    # Delegate to a Firebased::Account
    #
    # @return [Firebased::Account]
    def client
      @client = Firebased::Account.new(credentials) unless defined?(@client)
      @client
    end
    
    # Has a client been initialized on the Firebased module?
    #
    # @return [Boolean]
    def client?
      !!@client
    end
    
    
    def respond_to?(method_name, include_private=false)
      client.respond_to?(method_name, include_private) || super
    end
    
    private

      def method_missing(method_name, *args, &block)
        return super unless client.respond_to?(method_name)
        client.send(method_name, *args, &block)
      end
    
  end
end
