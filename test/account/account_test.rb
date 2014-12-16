require './test/test_helper'

class FirebasedAccountTest < Minitest::Test
  
  def test_exists
    assert Firebased::Account
  end
  
  def test_account_logs_in_when_token_omitted
    VCR.use_cassette('account', :record => :once) do
      account = Firebased::Account.new('email', 'pass')
      
      assert_equal Firebased::Account, account.class
      refute_nil   account.token
    end
  end
    
end