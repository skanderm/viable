defmodule Viable.Environment do
  use Ash.Resource, data_layer: AshPostgres.DataLayer, extensions: [AshJsonApi.Resource]

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

  json_api do
    type "environment"

    routes do
      base "/environments"

      get :read
      index :read
      post :create
      patch :update
      delete :destroy
    end
  end

end
