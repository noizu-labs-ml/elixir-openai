defmodule Noizu.OpenAI.Embeddings do

  @type t :: %__MODULE__{
    object: any,
    embeddings: any,
    model: any,
    usage: any
  }
  defstruct [
    :object,
    :embeddings,
    :model,
    :usage
  ]

  def from_json(%{
    :object => object,
    :data => data,
    :model => model,
    :usage => usage
  }) do
    data = Enum.map(data, &Noizu.OpenAI.Embeddings.Embedding.from_json/1)
    %__MODULE__{
      object: object,
      embeddings: data,
      model: model,
      usage: usage
    }
  end

  defmodule Embedding do
    defstruct [
      :object,
      :embedding,
      :index
    ]

    def from_json(%{
      :object => object,
      :embedding => embedding,
      :index => index
    }) do
      %__MODULE__{
        object: object,
        embedding: embedding,
        index: index
      }
    end
  end
end