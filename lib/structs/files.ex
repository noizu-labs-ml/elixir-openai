
defmodule Noizu.OpenAI.Files do
  alias Noizu.OpenAI.File

  defstruct [:list, :object]

  @type t :: %__MODULE__{
               list: [File.t()],
               object: String.t()
             }


  def from_json(json, object \\ nil)
  def from_json(json, object) when is_list(json) do
    %__MODULE__{
      list: Enum.map(json, &Noizu.OpenAI.File.from_json/1),
      object: object
    }
  end
  def from_json(json, object) when is_map(json) do
    %__MODULE__{
      list: Enum.map(json[:data], &Noizu.OpenAI.File.from_json/1),
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