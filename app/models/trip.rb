class Trip < ActiveRecord::Base
  def self.in_period(first, last)
    where('starts_on >= ?', first).where('ends_on <= ?', last)
  end
end
