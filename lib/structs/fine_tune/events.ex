
defmodule Noizu.OpenAI.FineTune.Events do
  @moduledoc """
  A struct representing a FineTune.Events list.
  """

  defstruct [:list, :object]
  @type t :: %__MODULE__{
               list: list(Noizu.OpenAI.FineTune.Event.t),
               object: String.t | nil
             }
  def from_json(json, object \\ nil)
  def from_json(json, object) when is_list(json) do
    %__MODULE__{
      list: Enum.map(json, &Noizu.OpenAI.FineTune.Event.from_json/1),
      object: object
    }
  end
  def from_json(json, object) when is_map(json) do
    %__MODULE__{
      list: Enum.map(json[:data], &Noizu.OpenAI.FineTune.Event.from_json/1),
      object: json[:object] || object
    }
  end

  def from_json(nil, object) do
    %__MODULE__{
      list: [],
      object: object
    }
  end
end