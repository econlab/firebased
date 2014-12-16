require 'securerandom'
require './test/test_helper'

class FirebasedAccountTest < Minitest::Test
  
  def setup
    @account = Firebased::Account.new('email', 'pass', 'token')
    @hash = SecureRandom.hex.to_s
  end
  
  def test_can_create_firebase
    p @hash
    VCR.use_cassette('firebase_created', :record => :all) do
      fb = @account.create_firebase(@hash)
      refute_nil fb
    end
  end
  
  def test_can_get_firebase
    p @hash
    fb = @account.get_firebase(@hash)
    refute_nil fb
  end
  
  def test_can_delete_firebase
    p @hash
    VCR.use_cassette('firebase_deleted', :record => :all) do
      fb = @account.delete_firebase(@hash)
      assert_nil @account.bases[@hash]
    end
  end
    
end