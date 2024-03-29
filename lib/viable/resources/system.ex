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

    attribute :name, :string, allow_nil?: false, constraints: [min_length: 1]
    attribute :description, :string

    attribute :level, :atom,
      allow_nil?: false,
      constraints: [one_of: [:one, :two, :three, :three_star, :four, :five]]

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
    read :read, primary?: true
    create :create do
      argument :parent, :map
      accept [:id, :name, :description, :level]
      change manage_relationship(:parent, type: :replace)
    end
    update :update
    destroy :destroy
  end

  def level_number(level) do
    case level do
      :one -> "1"
      :two -> "2"
      :three -> "3"
      :three_star -> "3*"
      :four -> "4"
      :five -> "5"
    end
  end
end
