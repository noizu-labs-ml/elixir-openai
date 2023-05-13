defmodule Noizu.OpenAI.Chat do
  defstruct [
    :id,
    :object,
    :created,
    :choices,
    :usage
  ]

  def from_json(%{
    :id => id,
    :object => object,
    :created => created,
    :choices => choices,
    :usage => usage
  }) do
    choices = Enum.map(choices, &Noizu.OpenAI.Chat.Choice.from_json/1)
    %__MODULE__{
      id: id,
      object: object,
      created: created |> DateTime.from_unix!(),
      choices: choices,
      usage: usage
    }
  end

  defmodule Choice do
    defstruct [
      :index,
      :message,
      :finish_reason
    ]

    def from_json(%{
      :index => index,
      :message => message,
      :finish_reason => finish_reason
    }) do
      %__MODULE__{
        index: index,
        message: message,
        finish_reason: finish_reason
      }
    end
  end
end
