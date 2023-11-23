defmodule Noizu.OpenAI.Completion do
  @derive Jason.Encoder
  defstruct [
    :id,
    :object,
    :created,
    :model,
    :choices,
    :usage
  ]

  def from_json(%{
    :id => id,
    :object => object,
    :created => created,
    :model => model,
    :choices => choices,
    :usage => usage
  }) do
    choices = Enum.map(choices, &Noizu.OpenAI.Completion.Choice.from_json/1)
    %__MODULE__{
      id: id,
      object: object,
      created: created |> DateTime.from_unix!(),
      model: model,
      choices: choices,
      usage: usage
    }
  end

  defmodule Choice do
    defstruct [
      :text,
      :index,
      :logprobs,
      :finish_reason
    ]

    def from_json(%{
      :text => text,
      :index => index,
      :logprobs => logprobs,
      :finish_reason => finish_reason
    }) do
      %__MODULE__{
        text: text,
        index: index,
        logprobs: logprobs,
        finish_reason: finish_reason
      }
    end
  end
end
