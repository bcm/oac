class Trip < ActiveRecord::Base
  enum category: [:hiking, :backpacking, :climbing, :kayaking, :rafting]

  def self.in_period(first, last)
    where('starts_on >= ?', first).where('ends_on <= ?', last)
  end
end
