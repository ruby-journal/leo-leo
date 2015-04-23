require_relative '../../config/environment'

module Leoleo
  class Migrator
    require 'sequel'
    def self.migrate!
      db = Sequel.connect(ENV['LEOLEO_DATABASE_URL'])

      db.create_table! :users do
        Interger :id
        String   :name
        String   :email
        Interger :gender
        String   :about
        String   :image_url
      end
    end
  end
end
