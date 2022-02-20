defmodule ViableWeb.PageController do
  use ViableWeb, :controller

  def index(conn, _params) do
    system = Viable.System |> Ash.Query.limit(1) |> Viable.Api.read_one!()
    system_attrs = Ash.Resource.Info.attributes(Viable.System) |> Enum.map(&Map.get(&1, :name))
    system_json = system |> Map.from_struct |> Map.take(system_attrs) |> Jason.encode!

    render(conn, "index.html", system: system, system_json: system_json)
  end
end
