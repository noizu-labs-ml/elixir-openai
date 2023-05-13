defmodule Noizu.OpenAI.Engine do
  @moduledoc """
  The Noizu.OpenAI.Engine struct represents an engine object from the OpenAI API.
  """

  defstruct [
    :id,
    :object,
    :owner,
    :ready
  ]

  @type t :: %Noizu.OpenAI.Engine{
               id: String.t(),
               object: String.t(),
               owner: String.t(),
               ready: boolean()
             }

  @doc """
  Creates a Noizu.OpenAI.Engine struct from a map with atom keys.

  ## Examples

      iex> json = %{
      ...>   id: "text-davinci-003",
      ...>   object: "engine",
      ...>   owner: "openai",
      ...>   ready: true
      ...> }
      ...> Noizu.OpenAI.Engine.from_json(json)
      %Noizu.OpenAI.Engine{
        id: "text-davinci-003",
        object: "engine",
        owner: "openai",
        ready: true
      }

  """
  @spec from_json(map) :: t
  def from_json(%{id: id, object: object, owner: owner, ready: ready}) do
    %Noizu.OpenAI.Engine{
      id: id,
      object: object,
      owner: owner,
      ready: ready
    }
  end
end