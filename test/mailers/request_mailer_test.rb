require 'test_helper'

class RequestMailerTest < ActionMailer::TestCase
  test "new_request" do
    mail = RequestMailer.new_request
    assert_equal "New request", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
