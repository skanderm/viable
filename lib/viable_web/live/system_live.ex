defmodule ViableWeb.SystemLive do
  use ViableWeb, :live_view

  def render(assigns) do
    Phoenix.View.render(ViableWeb.PageView, "system.html", assigns)
  end

  def mount(_params, context, socket) do
    IO.inspect(context, label: "context")
    systems = Viable.System |> Ash.Query.load(:parent) |> Viable.Api.read!
    system_attrs = Ash.Resource.Info.attributes(Viable.System) |> Enum.map(&Map.get(&1, :name))

    system_jsons =
      systems
      |> Enum.map(fn system ->
        {system, system |> Map.from_struct() |> Map.take(system_attrs) |> Jason.encode!()}
      end)

    {:ok, assign(socket, :systems, system_jsons)}
  end
end
