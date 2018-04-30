# == Schema Information
#
# Table name: auto_requests
#
#  id         :integer          not null, primary key
#  file       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "simple-spreadsheet"

class AutoRequest < ApplicationRecord
    mount_uploader :file, ExcelUploader
    validates :file, presence: true

    def addDataFromExcel
        s = SimpleSpreadsheet::Workbook.read(Dir.getwd + "/public" + file.url)
        s.selected_sheet = s.sheets.first
        data = false
        line = 11
        while s.cell(line, 1) != nil do 
            p code = s.cell(line, 1).to_i
            p subject = s.cell(line, 2).to_s
            p group = s.cell(line, 3).to_i
            p capacity = s.cell(line, 4).to_i
            p day = s.cell(line, 11).to_i
            p begin_time = s.cell(line, 12).to_s
            p end_time = s.cell(line, 13).to_s
            p buildign = s.cell(line, 14).to_i
            p classroom = s.cell(line, 15).to_i
            

            line += 1
        end

    end
    # AutoRequest.last.addDataFromExcel


end
