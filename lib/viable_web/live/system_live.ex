defmodule ViableWeb.SystemLive do
  use ViableWeb, :live_view

  require Ash.Query

  def render(assigns) do
    case assigns do
      %{system_id: system_id} when not is_nil(system_id) ->
        Phoenix.View.render(ViableWeb.PageView, "system.html", assigns)
      _ ->
        ~H"""
          <div class="container mx-auto">
            <%= f = form_for @form, "#", [phx_change: :validate, phx_submit: :save] %>
            <div class="flex flex-col mb-3">
              <div class="mt-1 relative rounded-md focus:shadow-sm max-w-sm">
                <%= text_input f, :name, class: "focus:ring-gray-400 focus:border-gray-400 block w-full p-2 sm:text-sm border border-transparent border-b-gray-300 focus:rounded-md focus:outline-none", placeholder: "System name" %>
              </div>
              <%= error_tag f, :name, class: "text-sm text-red-500 ml-2" %>
              <div class="mt-1 relative rounded-md focus:shadow-sm max-w-sm">
                <%= textarea f, :description, class: "focus:ring-gray-400 focus:border-gray-400 border block w-full p-2 sm:text-sm focus:rounded-md border border-transparent border-b-gray-300 focus:outline-none", placeholder: "System description" %>
              </div>
              <%= error_tag f, :description, class: "text-sm text-red-500 ml-2" %>
              <%= hidden_input f, :level, value: @level %>
            </div>
            <%= submit "Save", class: "py-2 px-4 text-white bg-emerald-600/80 rounded " %>
          </div>
        """
    end
  end

  def mount(params, session, socket) do
    system_id =
      case params do
        %{"id" => id} -> id
        _ -> Map.get(session, "system_id")
      end

    if system_id do
      :ok = Phoenix.PubSub.subscribe(Viable.PubSub, "system:#{system_id}")
    end

    assigns =
      socket
      |> assign(:system_id, system_id)
      |> assign(:system, get_system(system_id))
      |> assign(:form, new_form())
      |> assign(:level, :one)

    {:ok, assigns}
  end

  def new_form() do
    Viable.System
    |> AshPhoenix.Form.for_create(:create, api: Viable.Api)
  end

  def handle_event("validate", %{"form" => params}, socket) do
    form = AshPhoenix.Form.validate(socket.assigns.form, params)
    {:noreply, assign(socket, :form, form)}
  end

  def handle_event("save", params, socket) do
    case AshPhoenix.Form.submit(socket.assigns.form) do
      {:ok, system} ->
        {:noreply, push_redirect(socket, to: Routes.system_path(socket, :show, system.id), replace: true)}

      {:error, form} ->
        {:noreply, assign(socket, :form, form)}
    end
  end

  def handle_info(:update_list, socket) do
    {:noreply, assign(socket, :system, get_system(socket.assigns.system.id))}
  end

  def get_system(system_id) do
    # Not very efficient - loads the system, its children,
    # then itself again through the :parent relationship
    case system_id do
      nil -> nil
      _ ->
        Viable.System
        |> Ash.Query.filter(id == ^system_id)
        |> Ash.Query.load([:parent, children: :parent])
        |> Viable.Api.read_one!()
    end
  end
end
