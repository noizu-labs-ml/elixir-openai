defmodule Noizu.OpenAI.Messages do
  @moduledoc """
  Represents a list of messages.
  """
  @derive Jason.Encoder
  defstruct [:object, :data, :first_id, :last_id, :has_more]

  @type t :: %__MODULE__{
               object: String.t(),
               data: list(Noizu.OpenAI.Message.t()),
               first_id: String.t(),
               last_id: String.t(),
               has_more: boolean()
             }

  def from_json(%{
    object: object,
    data: data,
    first_id: first_id,
    last_id: last_id,
    has_more: has_more
  }) do
    %__MODULE__{
      object: object,
      data: Enum.map(data, &Noizu.OpenAI.Message.from_json(&1)),
      first_id: first_id,
      last_id: last_id,
      has_more: has_more
    }
  end
end
