defmodule ViableWeb.SystemLive.New do
  use ViableWeb, :live_component

  require Ash.Query

  def render(assigns) do
    Phoenix.View.render(ViableWeb.SystemView, "new.html", assigns)
  end

  def mount(socket) do
    {:ok, socket}
  end

  def new_form(parent) do
    Viable.System
    |> AshPhoenix.Form.for_create(:create, api: Viable.Api,
      forms: [
        parent: [
          resource: Viable.System,
          update_action: :update,
          data: parent
        ]
      ]
    )
  end

  def update(assigns, socket) do
    classes =
      assigns
      |> Map.get(:classes, " ")

    assigns =
      socket
      |> assign(assigns)
      |> assign(:classes, classes)
      |> assign(:form, new_form(assigns.parent))

    {:ok, assigns}
  end

  # In order to use the `add_form` and `remove_form` helpers, you
  # need to make sure that you are validating the form on change
  def handle_event("validate", %{"form" => params}, socket) do
    form = AshPhoenix.Form.validate(socket.assigns.form, params)
    {:noreply, assign(socket, :form, form)}
  end

  def handle_event("save", params, socket) do
    case AshPhoenix.Form.submit(socket.assigns.form) do
      {:ok, result} ->
        with %{parent: parent} when not is_nil(parent) <- socket.assigns do
          :ok =
            Phoenix.PubSub.broadcast(
              Viable.PubSub,
              "system:#{socket.assigns.parent.id}",
              :update_list
            )
        end

        {:noreply, assign(socket, :form, new_form(Map.get(socket.assigns, "parent")))}

      {:error, form} ->
        {:noreply, assign(socket, :form, form)}
    end
  end

  def handle_event("toggle_skeleton", _, socket) do
    {:noreply, assign(socket, :skeleton, !socket.assigns.skeleton)}
  end

  def handle_event("enable_skeleton", _, socket) do
    {:noreply, assign(socket, :skeleton, true)}
  end
end
