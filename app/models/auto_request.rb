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
        while s.cell(line, 1) != nil 
            p code = s.cell(line, 1).to_i
            p subject = s.cell(line, 2).to_s
            p group = s.cell(line, 3).to_i
            p capacity = s.cell(line, 4).to_i
            p day = s.cell(line, 11).to_i
            p begin_time = s.cell(line, 12).to_s.split(":")
            p end_time = s.cell(line, 13).to_s.split(":")
            p buildign = s.cell(line, 14).to_i
            p classroom = s.cell(line, 15).to_i
            
            if Subject.find_by(code: code) == nil
                Subject.create(
                    name: subject,
                    code: code
                )
            end
            sub = Subject.find_by(code: code)

            if Group.find_by(number: group, subject_id: sub.id ) == nil
                Group.create(
                    number: group,
                    subject_id: sub.id
                )
            end
            gr = Group.find_by(number: group, subject_id: sub.id )
            if CyclicSchedule.find_by(day: day, 
                begin_at_hour: begin_time[0].to_i, begin_at_minute: begin_time[1].to_i,
                end_at_hour: end_time[0].to_i, end_at_minute: end_time[1].to_i
                ) == nil
                CyclicSchedule.create(day: day, 
                    begin_at_hour: begin_time[0].to_i, begin_at_minute: begin_time[1].to_i,
                    end_at_hour: end_time[0].to_i, end_at_minute: end_time[1].to_i
                )
            end

            cysh = CyclicSchedule.find_by(day: day, 
                begin_at_hour: begin_time[0].to_i, begin_at_minute: begin_time[1].to_i,
                end_at_hour: end_time[0].to_i, end_at_minute: end_time[1].to_i)
            
            fac = Faculty.find_by(name: "Ingenieria")

            if Building.find_by(number: buildign) == nil
                Building.create(
                    faculty_id: fac.id,
                    name: "nil",
                    number: buildign
                )
            end
            buil = Building.find_by(number: buildign)

            if Classroom.find_by(number: classroom, building_id: buil.id) == nil
                Classroom.create(
                    type_classroom: TypeClassroom.last,
                    building_id: buil.id,
                    department_id: Department.last.id,
                    capacity: capacity,
                    number: classroom
                )
            end
            clas = Classroom.find_by(number: classroom, building_id: buil.id)

            ClassroomSchedule.create(
                classroom_id: clas.id,
                group_id: gr.id,
                cyclic_schedule_id: cysh.id
            )




            line += 1
            
        end

    end
    # AutoRequest.last.addDataFromExcel


end
