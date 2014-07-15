class Trip < ActiveRecord::Base
  enum category: [:hiking, :backpacking, :climbing, :kayaking, :camping, :rafting]

  def self.in_period(first, last)
    where('starts_on >= ?', first).where('starts_on <= ?', last)
  end
end
