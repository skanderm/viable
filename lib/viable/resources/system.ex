defmodule Viable.System do
  use Ash.Resource,
    data_layer: AshPostgres.DataLayer,
    extensions: [AshJsonApi.Resource]

  postgres do
    table "systems"
    repo Viable.Repo
  end

  attributes do
    uuid_primary_key :id

    attribute :name, :string
    attribute :description, :string

    attribute :type, :atom, constraints: [one_of: [:one, :two, :three, :three_star, :four, :five]]

    create_timestamp :inserted_at
    update_timestamp :updated_at
  end

  relationships do
    belongs_to :parent, Viable.System do
      source_field :parent_id
    end

    has_many :children, Viable.System do
      destination_field :parent_id
    end
  end

  json_api do
    type "system"

    routes do
      base "/systems"

      get :read
      index :read
      post :create, relationship_arguments: [:parent]
      patch :update
      delete :destroy
    end
  end

  actions do
    create :create do
      accept [:id, :name, :description, :type]

      argument :parent, :map

      change manage_relationship(:parent, type: :replace)
    end
  end
end
