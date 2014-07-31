class User < ActiveRecord::Base
  def self.find_or_create_from_oauth!(oauth)
    find_or_create_by!(email: oauth.info.email) do |user|
      user.uuid ||= SecureRandom.uuid
    end
  end
end
