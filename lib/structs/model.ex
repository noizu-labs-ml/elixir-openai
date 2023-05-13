defmodule Noizu.OpenAI.Model do
  @moduledoc """
  Struct representing an individual OpenAI Model.
  """
  @type t :: %__MODULE__{
               id: String.t(),
               object: String.t(),
               owned_by: String.t(),
               permission: list()
             }

  defstruct [
    :id,
    :object,
    :owned_by,
    :permission
  ]

  @doc """
  Creates a `Noizu.OpenAI.Model` struct from the provided JSON map.
  """
  def from_json(%{id: id, object: object, owned_by: owned_by, permission: permission}) do
    %__MODULE__{
      id: id,
      object: object,
      owned_by: owned_by,
      permission: permission
    }
  end
end
