require 'test_helper'

class CronMailerTest < ActionMailer::TestCase
  test "pending_requests" do
    mail = CronMailer.pending_requests
    assert_equal "Pending requests", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
