defmodule ViableWeb.PageView do
  use ViableWeb, :view

  def ones(system) do
    Enum.filter(system.children, &( &1.level == :one ))
  end

  def two(system) do
    Enum.find(system.children, &( &1.level == :two ))
  end

  def three(system) do
    Enum.find(system.children, &( &1.level == :three ))
  end

  def three_star(system) do
    Enum.find(system.children, &( &1.level == :three_star ))
  end

  def four(system) do
    Enum.find(system.children, &( &1.level == :four ))
  end

  def five(system) do
    Enum.find(system.children, &( &1.level == :five ))
  end

end
