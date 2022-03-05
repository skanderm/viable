defmodule ViableWeb.SystemLive do
  use ViableWeb, :live_view

  require Ash.Query

  def render(assigns) do
    Phoenix.View.render(ViableWeb.PageView, "system.html", assigns)
  end

  def mount(params, %{"system_id" => system_id}, socket) do
    :ok = Phoenix.PubSub.subscribe(Viable.PubSub, "system:#{system_id}")
    assigns = socket
    |> assign(:system_id, system_id)
    |> assign(:system, get_system(system_id))

    {:ok, assigns}
  end

  def handle_info(:update_list, socket) do
    {:noreply, assign(socket, :system, get_system(socket.assigns.system_id))}
  end

  def get_system(system_id) do
    # Not very efficient
    Viable.System
    |> Ash.Query.filter(id == ^system_id)
    |> Ash.Query.load([:parent, children: :parent])
    |> Viable.Api.read_one!()
  end
end
