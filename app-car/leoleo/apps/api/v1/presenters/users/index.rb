require 'representative/json'

module ApiV1
  module Presenters
    module Users
      class Index
        attr_reader :users

        def initialize(users)
          @users = users
        end

        def render
          Representative::Json.new do |r|
            r.list_of :users, users do
              r.element :id
              r.element :name
              r.element :email
              r.element :gender
              r.element :about
              r.element :image_url
            end
          end.to_s
        end
      end
    end
  end
end
