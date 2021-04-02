defmodule NaviWeb.ConnCase do
  @moduledoc """
  This module defines the test case to be used by
  tests that require setting up a connection.

  Such tests rely on `Phoenix.ConnTest` and also
  import other functionality to make it easier
  to build common data structures and query the data layer.

  Finally, if the test case interacts with the database,
  we enable the SQL sandbox, so changes done to the database
  are reverted at the end of every test. If you are using
  PostgreSQL, you can even run database tests asynchronously
  by setting `use NaviWeb.ConnCase, async: true`, although
  this option is not recommended for other databases.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      # Import conveniences for testing with connections
      import Plug.Conn
      import Phoenix.ConnTest
      import NaviWeb.ConnCase
      import Mox

      alias NaviWeb.Router.Helpers, as: Routes

      # The default endpoint for testing
      @endpoint NaviWeb.Endpoint

      setup :verify_on_exit!

      def put_auth_token(conn) do
        token = NaviWeb.Token.generate_and_sign!()

        put_req_header(conn, "authorization", "Bearer #{token}")
      end
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Navi.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Navi.Repo, {:shared, self()})
    end

    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end
end
