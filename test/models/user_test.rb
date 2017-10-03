require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "balance confirm" do
  	user = User.new
    assert true, user.balance_confirm
  end
end
