defmodule ViableWeb.PageController do
  use ViableWeb, :controller

  require Ash.Query

  def index(conn, _params) do
    system =
      Viable.System
      |> Ash.Query.filter(is_nil(parent_id) and name == "Viable Coop")
      |> Ash.Query.limit(1)
      |> Viable.Api.read_one!()

    render(conn, "index.html", system: system)
  end
end
