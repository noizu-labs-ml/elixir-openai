
defmodule Noizu.OpenAI.Assistants do
  @moduledoc """
  Struct representing a collection of OpenAI Models.
  """
  @derive Jason.Encoder
  @type t :: %__MODULE__{
               object: String.t,
               data: list(),
               first_id: String.t,
               last_id: String.t,
               has_more: boolean
             }

  defstruct [
    :object,
    :data,
    :first_id,
    :last_id,
    :has_more
  ]

  @doc """
  Creates a `Noizu.OpenAI.Models` struct from the provided JSON map.
  """
  def from_json(%{data: data, object: object, first_id: first_id, last_id: last_id, has_more: has_more}) do
    data = Enum.map(data, &Noizu.OpenAI.Assistant.from_json/1)

    %__MODULE__{
      data: data,
      object: object,
      first_id: first_id,
      last_id: last_id,
      has_more: has_more
    }
  end
end
