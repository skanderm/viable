defmodule Viable.Channel do
  use Ash.Resource, data_layer: AshPostgres.DataLayer, extensions: [AshJsonApi.Resource]

  postgres do
    table "channels"
    repo Viable.Repo
  end

  attributes do
    uuid_primary_key :id

    attribute :name, :string
    attribute :description, :string

    create_timestamp :inserted_at
    update_timestamp :updated_at
  end

  relationships do
    # We could also make these polymorphic with a single
    # :from_id and :to_id where we also add attributes :from_type
    # and :to_type that are one_of [Viable.System, Viable.Environment]
    # See: https://hexdocs.pm/ash_postgres/polymorphic_resources.html

    belongs_to :from_system, Viable.System do
      source_field :from_system_id
    end

    belongs_to :to_system, Viable.System do
      source_field :to_system_id
    end

    belongs_to :from_environment, Viable.Environment do
      source_field :from_environment_id
    end

    belongs_to :to_environment, Viable.Environment do
      source_field :to_environment_id
    end
  end

  json_api do
    type "channel"

    routes do
      base "/channels"

      get :read
      index :read
      post :create
      patch :update
      delete :destroy
    end
  end
end
