defmodule ViableWeb.SystemLive.New do
  use ViableWeb, :live_view

  require Ash.Query

  alias ViableWeb.SystemLive

  def render(assigns) do
    Phoenix.View.render(ViableWeb.SystemView, "new.html", assigns)
  end

  def mount(_params, context, socket) do
    parent_id = Map.get(context, "parent_id")

    parent =
      if !is_nil(parent_id) do
        Viable.System |> Ash.Query.filter(id == ^parent_id) |> Viable.Api.read_one!()
      end

    assigns =
      socket
      |> assign(:form, new_form(parent))
      |> assign(:parent, parent)
      |> assign(:parent_id, parent_id)

    {:ok, assigns}
  end

  def new_form(parent) do
    Viable.System
    |> AshPhoenix.Form.for_create(:create,
      api: Viable.Api,
      forms: [parent: [resource: Viable.System, update_action: :update, data: parent]]
    )
  end

  # In order to use the `add_form` and `remove_form` helpers, you
  #
  # need to make sure that you are validating the form on change
  def handle_event("validate", %{"form" => params}, socket) do
    form = AshPhoenix.Form.validate(socket.assigns.form, params)
    # You can also skip errors by setting `errors: false` if you only want to show errors on submit
    # form = AshPhoenix.Form.validate(socket.assigns.form, params, errors: false)
    {:noreply, assign(socket, :form, form)}
  end

  def handle_event("save", params, socket) do
    case AshPhoenix.Form.submit(socket.assigns.form) do
      {:ok, result} ->
        with %{parent_id: parent_id} when not is_nil(parent_id) <- socket.assigns do
          :ok =
            Phoenix.PubSub.broadcast(
              Viable.PubSub,
              "system:#{socket.assigns.parent_id}",
              :update_list
            )
        end

        {:noreply, assign(socket, :form, new_form(socket.assigns.parent))}

      {:error, form} ->
        {:noreply, assign(socket, :form, form)}
    end
  end
end
