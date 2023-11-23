
defmodule Noizu.OpenAI.FineTune.Event do
  @moduledoc """
  A struct representing a FineTune.Event object.
  """
  @derive Jason.Encoder
  defstruct [:object, :created_at, :level, :message]
  @type t :: %__MODULE__{
               object: String.t(),
               created_at: integer(),
               level: String.t(),
               message: String.t()
             }
  def from_json(json) do
    %__MODULE__{
      object: json[:object],
      created_at: DateTime.from_unix!(json[:created_at]),
      level: json[:level],
      message: json[:message]
    }
  end
end
