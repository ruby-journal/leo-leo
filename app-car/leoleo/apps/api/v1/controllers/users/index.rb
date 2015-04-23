module ApiV1
  module Controllers
    module Users
      ##
      # Return all users
      #
      # GET /api/v1/users
      #
      # example:
      #
      #   curl -i -H "Accept: application/json" http://0.0.0.0:2300/api/v1/users
      #
      #   status
      #   => 200
      #
      class Index
        include ApiV1::Action
        accept :json

        def call(params)
          users = UserRepository.all
          self.body = ApiV1::Presenters::Users::Index.new(users).render
        end
      end
    end
  end
end