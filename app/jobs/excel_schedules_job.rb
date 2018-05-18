class ExcelSchedulesJob < ApplicationJob
  queue_as :default

  def perform(auto_request)
    auto_request.addDataFromExcel
  end
end
