defmodule ViableWeb.SystemLive.New do
  use ViableWeb, :live_view

  require Ash.Query

  alias ViableWeb.SystemLive

  def new_form() do
    Viable.System
    |> AshPhoenix.Form.for_create(:create,
      api: Viable.Api,
      forms: [
        system: [
          resource: Viable.System,
          create_action: :create,
          update_action: :update
        ]
      ]
    )
  end

  def render(assigns) do
    Phoenix.View.render(ViableWeb.SystemView, "new.html", assigns)
  end

  def mount(_params, context, socket) do
    parent_options =
      Viable.System
      |> Ash.Query.filter(level == :one)
      |> Viable.Api.read!()
      |> Enum.map(&{&1.name, &1})
      |> Enum.into([])

    {:ok, assign(socket, form: new_form(), parent_options: parent_options)}
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

  def handle_event("save", _params, socket) do
    case AshPhoenix.Form.submit(socket.assigns.form) do
      {:ok, result} ->
        with [{pid, pid}] <- Registry.lookup(Viable.Registry, ViableWeb.SystemLive) do
          GenServer.call(pid, :update_list)
        end

        {:noreply, assign(socket, :form, new_form())}

      {:error, form} ->
        {:noreply, assign(socket, :form, form)}
    end
  end
end
