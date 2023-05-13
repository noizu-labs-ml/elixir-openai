
defmodule Noizu.OpenAI.Models do
  @moduledoc """
  Struct representing a collection of OpenAI Models.
  """
  @type t :: %__MODULE__{
               models: list(Noizu.OpenAI.Model.t()),
               object: String.t()
             }

  defstruct [
    :models,
    :object
  ]

  @doc """
  Creates a `Noizu.OpenAI.Models` struct from the provided JSON map.
  """
  def from_json(%{data: data, object: object}) do
    models = Enum.map(data, &Noizu.OpenAI.Model.from_json/1)

    %__MODULE__{
      models: models,
      object: object
    }
  end
end