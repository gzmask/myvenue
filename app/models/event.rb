class Event < ActiveRecord::Base
	belongs_to :schedule
	validates_presence_of :weekly, :if => :weekly_recurrence?
	validates_presence_of :monthly, :if => :monthly_recurrence?
        validate :recurrence_once

  def weekly_recurrence?
    self.recurrence == 2
  end

  def monthly_recurrence?
    self.recurrence == 3
  end

  def recurrence_once
    if self.recurrence == 0
      errors.add(:defective_date, "has to be equal to effective date when having an once event") if self.effective_date != self.defective_date
    else
      true
    end
  end

end
