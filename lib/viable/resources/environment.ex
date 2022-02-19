defmodule Viable.Environment do
  use Ash.Resource, data_layer: AshPostgres.DataLayer

  postgres do
    table "environments"
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
    belongs_to :parent, Viable.Environment do
      source_field :parent_id
    end

    has_many :children, Viable.Environment do
      destination_field :parent_id
    end
  end
end
