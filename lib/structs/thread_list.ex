defmodule Noizu.OpenAI.ThreadList do
  @moduledoc """
  Represents a list of threads.
  """
  defstruct [:object, :data, :first_id, :last_id, :has_more]

  @type t :: %__MODULE__{
               object: String.t(),
               data: list(Noizu.OpenAI.Thread.t()),
               first_id: String.t(),
               last_id: String.t(),
               has_more: boolean()
             }

  def from_json(%{
    "object" => object,
    "data" => data,
    "first_id" => first_id,
    "last_id" => last_id,
    "has_more" => has_more
  }) do
    %__MODULE__{
      object: object,
      data: Enum.map(data, &Noizu.OpenAI.Thread.from_json(&1)),
      first_id: first_id,
      last_id: last_id,
      has_more: has_more
    }
  end
end
