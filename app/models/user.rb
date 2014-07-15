class User < ActiveRecord::Base
  def self.find_or_create_from_auth_hash!(auth_hash)
    find_or_create_by!(email: auth_hash[:info][:email]) do |user|
      user.uuid ||= SecureRandom.uuid
    end
  end
end
