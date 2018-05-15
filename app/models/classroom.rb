# == Schema Information
#
# Table name: classrooms
#
#  id                :integer          not null, primary key
#  type_classroom_id :integer
#  building_id       :integer
#  department_id     :integer
#  capacity          :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  number            :integer
#
# Indexes
#
#  index_classrooms_on_building_id        (building_id)
#  index_classrooms_on_department_id      (department_id)
#  index_classrooms_on_type_classroom_id  (type_classroom_id)
#
# Foreign Keys
#
#  fk_rails_...  (building_id => buildings.id)
#  fk_rails_...  (department_id => departments.id)
#  fk_rails_...  (type_classroom_id => type_classrooms.id)
#

class Classroom < ApplicationRecord
  include ActiveModel::Serialization

  validates :type_classroom_id, presence: true, numericality: { only_integer: true }
  validates :building_id, presence: true, numericality: { only_integer: true }
  validates :department_id, presence: true, numericality: { only_integer: true }
  validates :capacity, presence: true, numericality: { only_integer: true }

  belongs_to :type_classroom
  belongs_to :building
  belongs_to :department
  has_many :classroom_schedules
  has_many :cyclic_schedules, through: :classroom_schedules
  has_many :cyclic_requests, through: :cyclic_schedules
  has_many :opinions, through: :classroom_schedules
  has_many :classroom_events
  has_many :specific_schedules, through: :classroom_events
  has_many :specific_requests, through: :specific_schedules

  # add query for opinion, not in opinion, because I think that it is no necesaary
  def self.get_data(hb_id)
    Classroom
    .joins(:type_classroom)
    .where('classrooms.id = ?',hb_id)
    .select('type_classrooms.name').limit(1) 
  end

  def taken_schedules(a, b)
    ini = DateTime.parse(a)
    fin = DateTime.parse(b)
    
    ans = Array.new
    
    cs = classroom_schedules
    for i in cs
      gr = i.group.number.to_s
      subj = i.group.subject.name
      teach = i.group.teacher
      cyc = i.cyclic_schedule
      ini2 = DateTime.new(ini.year, ini.month, ini.day, cyc.begin_at_hour, cyc.begin_at_minute, 0)
      fin2 = DateTime.new(ini.year, ini.month, ini.day, cyc.end_at_hour, cyc.end_at_minute, 0)
      while(ini2 <= fin)
        if ini2.wday ==  cyc.day
          hash = Hash.new
          hash[:title] = subj + ' - ' + gr +' - ' + teach.first_name + ' ' + teach.last_name
          hash[:start] = ini2
          hash[:end] = fin2
          ans.push(hash)
          
        end
        ini2 = ini2.next_day
        fin2 = fin2.next_day 
      end
    end

    clse = classroom_events
    for i in clse
      ss = i.specific_schedule
      temp_date = ss.date
      cde = DateTime.new(temp_date.year, temp_date.month, temp_date.day, ss.begin_at_hour, ss.begin_at_minute, 0)
      if (cde <= fin &&  cde >= ini)
        hash = Hash.new
        eve = i.event
        hash[:title] = eve.name + ' - ' + eve.description 
        hash[:start] = ini2
        hash[:end] = fin2
        ans.push(hash)
        
      end
    end
    return ans
  end

  def is_cyclic_available(day, b_h, b_m, e_h, e_m)
    for i in classroom_schedules
      cyc = i.cyclic_schedule
      req_ini = DateTime.new(2000,1,1,b_h.to_i, b_m.to_i, 0)
      req_end = DateTime.new(2000,1,1,e_h.to_i, e_m.to_i, 0)
      taken_ini = DateTime.new(2000,1,1,cyc.begin_at_hour, cyc.begin_at_minute, 0)
      taken_end = DateTime.new(2000,1,1,cyc.end_at_hour, cyc.end_at_minute, 0)
      
      if cyc.day != day || req_ini >= taken_end || req_end <= taken_ini
        a = 1
      else
        return false
      end
    end
    return true
  end

  def is_specific_available(ini, fin)
    req_ini = DateTime.parse(ini)
    req_end = DateTime.parse(fin)
    for i in classroom_events
      sc = i.specific_schedule
      dsc = sc.date
      taken_ini = DateTime.new(dsc.year, dsc.month, dsc.day, sc.begin_at_hour, sc.begin_at_minute, 0)
      taken_end = DateTime.new(dsc.year, dsc.month, dsc.day, sc.end_at_hour, sc.end_at_minute, 0)
      if req_ini >= taken_end || req_end <= taken_ini
        a = 1
      else
        return false
      end

    end

    return is_cyclic_available(req_ini.wday, req_ini.hour, req_ini.minute, req_end.hour, req_end.minute)


  end


end
