defmodule Viable.Channel do
  use Ash.Resource, data_layer: AshPostgres.DataLayer

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
end
