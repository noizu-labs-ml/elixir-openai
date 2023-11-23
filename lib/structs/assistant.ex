defmodule Noizu.OpenAI.Assistant do
  defstruct [
    :id,
    :object,
    :created_at,
    :name,
    :description,
    :model,
    :instructions,
    :tools,
    :file_ids,
    :metadata
  ]

  @type t :: %__MODULE__{
               id: String.t(),
               object: String.t(),
               created_at: integer(),
               name: String.t(),
               description: String.t(),
               model: String.t(),
               instructions: String.t(),
               tools: list(),
               file_ids: list(String.t()),
               metadata: map()
             }

  def from_json(json) do
    %__MODULE__{
      id: json[:id],
      object: json[:object],
      created_at: json[:created_at],
      name: json[:name],
      description: json[:description],
      model: json[:model],
      instructions: json[:instructions],
      tools: json[:tools],
      file_ids: json[:file_ids],
      metadata: json[:metadata]
    }
  end
end
