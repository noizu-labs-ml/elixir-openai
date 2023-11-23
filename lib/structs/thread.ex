defmodule Noizu.OpenAI.Thread do
  @moduledoc """
  Represents a thread that contains messages.
  """
  defstruct [:id, :object, :created_at, :metadata]

  @type t :: %__MODULE__{
               id: String.t(),
               object: String.t(),
               created_at: integer(),
               metadata: map()
             }

  def from_json(%{
    "id" => id,
    "object" => object,
    "created_at" => created_at,
    "metadata" => metadata
  }) do
    %__MODULE__{
      id: id,
      object: object,
      created_at: created_at,
      metadata: metadata
    }
  end
end
