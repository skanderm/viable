defmodule ViableWeb.PageController do
  use ViableWeb, :controller

  def index(conn, _params) do
    systems = Viable.System |> Viable.Api.read!

    system_attrs = Ash.Resource.Info.attributes(Viable.System) |> Enum.map(&Map.get(&1, :name))

    system_jsons =
      systems
      |> Enum.map(fn system ->
        {system, system |> Map.from_struct() |> Map.take(system_attrs) |> Jason.encode!()}
      end)

    render(conn, "index.html", systems: systems, system_jsons: system_jsons)
  end
end
