class DailyResumeJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Request.dailyMailer
  end
end
