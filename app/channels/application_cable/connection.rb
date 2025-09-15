module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_account
    def connect
      self.current_account = find_verified_account
    end

    private

    def find_verified_account
      if (verified_master = env['warden'].user(:master_account))
        verified_master
      elsif (verified_admin = env['warden'].user(:admin))
        verified_admin
      else
        reject_unauthorized_connection
      end
    end
  end
end
