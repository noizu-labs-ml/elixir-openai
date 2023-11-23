defmodule Noizu.OpenAI.FineTunes do
  @derive Jason.Encoder
  defstruct [
    :object,
    :list,
  ]

  @type t :: %__MODULE__{
               object: String.t(),
               list: list(Noizu.OpenAI.FineTune.t)
             }

  def from_json(json, object \\ nil)
  def from_json(json, object) when is_list(json) do
    %__MODULE__{
      list: Enum.map(json, &Noizu.OpenAI.FineTune.from_json/1),
      object: object
    }
  end
  def from_json(json, object) when is_map(json) do
    %__MODULE__{
      list: Enum.map(json[:data], &Noizu.OpenAI.FineTune.from_json/1),
      object: json[:object] || object
    }
  end
end
