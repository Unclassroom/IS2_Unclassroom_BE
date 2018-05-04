# == Schema Information
#
# Table name: requests
#
#  id                     :integer          not null, primary key
#  teacher_id             :integer
#  purpose_classroom_id   :integer
#  type_classroom_id      :integer
#  external_person_id     :integer
#  state                  :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  request_alternative_id :integer
#  motive                 :text
#  file                   :string
#
# Indexes
#
#  index_requests_on_external_person_id      (external_person_id)
#  index_requests_on_purpose_classroom_id    (purpose_classroom_id)
#  index_requests_on_request_alternative_id  (request_alternative_id)
#  index_requests_on_teacher_id              (teacher_id)
#  index_requests_on_type_classroom_id       (type_classroom_id)
#
# Foreign Keys
#
#  fk_rails_...  (external_person_id => external_people.id)
#  fk_rails_...  (purpose_classroom_id => purpose_classrooms.id)
#  fk_rails_...  (request_alternative_id => request_alternatives.id)
#  fk_rails_...  (teacher_id => teachers.id)
#  fk_rails_...  (type_classroom_id => type_classrooms.id)
#

class Request < ApplicationRecord
  mount_uploader :file, FileUploader

  ## validates
  validates :teacher_id, presence: true, numericality: { only_integer: true }
  # validates :external_person_id, presence: true, numericality: { only_integer: true }
  validates :purpose_classroom_id, presence: true, numericality: { only_integer: true }
  validates :type_classroom_id, presence: true, numericality: { only_integer: true }
  validates :state, presence: true 
  
  belongs_to :teacher
  belongs_to :purpose_classroom
  belongs_to :type_classroom
  belongs_to :external_person
  has_many :request_alternatives
  has_many :cyclic_requests, through: :request_alternatives
  has_many :specific_requests, through: :request_alternatives
  has_many :cyclic_schedule, through: :cyclic_requests
  has_many :specific_schedule, through: :specific_requests
 

  scope :group_by_month,   -> { group("date_trunc('month', created_at) ") }
  scope :exclude_user_ids, -> (ids) { where("user_id is not in (?)",ids) }

  def self.get_cyclic(hb_id)
    Request
    .joins(:cyclic_schedule, :request_alternatives, :cyclic_requests)
    .where('requests.id = ?',hb_id)
    .select('cyclic_schedules.day, cyclic_schedules.begin_at, cyclic_schedules.end_at').limit(1) 
  end
  def self.get_specific(hb_id)
    Request
    .joins(:specific_schedule, :request_alternatives, :specific_requests)
    .where('requests.id = ?',hb_id)
    .select('specific_schedules.date, specific_schedules.begin_at, specific_schedules.end_at').limit(1) 
  end

  def self.get_between_dates_by_purpose(begin_date, end_date)
    if(begin_date == nil)
      begin_date = "1-1-1000"
      end_date = "1-1-3000" 
    end
    return  PurposeClassroom.joins(:requests).where("requests.created_at >= ?", begin_date).
    where("requests.created_at <= ?", end_date).group(:name).count
  end

  def self.get_between_dates_by_month(begin_date, end_date)
    if(begin_date == nil)
      begin_date = "1-1-1000"
      end_date = "1-1-3000" 
    end
    return  Request.where("requests.created_at >= ?", begin_date).
    where("requests.created_at <= ?", end_date).group("TO_CHAR(created_at, 'Month YYYY')").count

  end

  def self.get_between_dates_by_state(begin_date, end_date)
    if(begin_date == nil)
      begin_date = "1-1-1000"
      end_date = "1-1-3000" 
    end
    return  Request.where("requests.created_at >= ?", begin_date).
    where("requests.created_at <= ?", end_date).group(:state).count
  end

  


end
