

defmodule Noizu.OpenAI.Engines do
  alias Noizu.OpenAI.Engine
  @derive Jason.Encoder
  defstruct [:list, :object]

  @type t :: %__MODULE__{
               list: [Engine.t()],
               object: String.t()
             }


  def from_json(json, object \\ nil)
  def from_json(json, object) when is_list(json) do
    %__MODULE__{
      list: Enum.map(json, &Noizu.OpenAI.Engine.from_json/1),
      object: object
    }
  end
  def from_json(json, object) when is_map(json) do
    %__MODULE__{
      list: Enum.map(json[:data], &Noizu.OpenAI.Engine.from_json/1),
      object: json[:object] || object
    }
  end


end
