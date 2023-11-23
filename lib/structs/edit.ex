
defmodule Noizu.OpenAI.Edit do
  @derive Jason.Encoder
  defstruct [
    :object,
    :created,
    :choices,
    :usage
  ]

  def from_json(%{
    :object => object,
    :created => created,
    :choices => choices,
    :usage => usage
  }) do
    choices = Enum.map(choices, &Noizu.OpenAI.Edit.Choice.from_json/1)
    %__MODULE__{
      object: object,
      created: created |> DateTime.from_unix!(),
      choices: choices,
      usage: usage
    }
  end

  defmodule Choice do
    defstruct [
      :text,
      :index
    ]

    def from_json(%{
      :text => text,
      :index => index
    }) do
      %__MODULE__{
        text: text,
        index: index
      }
    end
  end
end
