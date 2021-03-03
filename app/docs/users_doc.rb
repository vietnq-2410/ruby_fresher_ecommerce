module UsersDoc
  extend Apipie::DSL::Concern

  api :GET, "/v1/users", "List of users"

  meta author: {name: "Viet Dev"}

  example <<-SQL
    - Request
    ■ URL: /api/v1/users
    ■ Method : GET
    Header:
      Authorization : yes

    - Response
    ■ Status : 200
    ■ Body :
    {
      "status": true,
      "data": {
        "users": {
          "name": "Viet Dev",
          "email": "vietnq812@gmail.com",
          "role": "admin"
        }
      }
    }
  SQL

  def index; end
end
