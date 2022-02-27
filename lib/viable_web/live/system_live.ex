defmodule ViableWeb.SystemLive do
  use ViableWeb, :live_view

  def render(assigns) do
    Phoenix.View.render(ViableWeb.PageView, "system.html", assigns)
  end

  def mount(_params, context, socket) do
    Registry.register(Viable.Registry, ViableWeb.SystemLive, self())
    {:ok, assign(socket, :systems, get_systems())}
  end

  def handle_call(:update_list, _, socket) do
    {:noreply, assign(socket, :systems, get_systems())}
  end

  def get_systems() do
    systems = Viable.System |> Ash.Query.load(:parent) |> Viable.Api.read!()
    system_attrs = Ash.Resource.Info.attributes(Viable.System) |> Enum.map(&Map.get(&1, :name))

    system_jsons =
      systems
      |> Enum.map(fn system ->
        {system, system |> Map.from_struct() |> Map.take(system_attrs) |> Jason.encode!()}
      end)
  end
end
