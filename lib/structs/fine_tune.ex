
defmodule Noizu.OpenAI.FineTune do
  defstruct [
    :id,
    :object,
    :model,
    :created_at,
    :events,
    :fine_tuned_model,
    :hyper_params,
    :organization_id,
    :result_files,
    :status,
    :validation_files,
    :training_files,
    :updated_at
  ]

  @type t :: %__MODULE__{
               id: String.t(),
               object: String.t(),
               model: String.t(),
               created_at: DateTime.t,
               events: [Noizu.OpenAI.FineTune.Event.t()],
               fine_tuned_model: String.t(),
               hyper_params: map(),
               organization_id: String.t(),
               result_files: [Noizu.OpenAI.File.t()],
               status: String.t(),
               validation_files: list(),
               training_files: [Noizu.OpenAI.File.t()],
               updated_at: DateTime.t
             }

  def from_json(json) do
    %__MODULE__{
      id: json[:id],
      object: json[:object],
      model: json[:model],
      created_at: json[:created_at] && DateTime.from_unix!(json[:updated_at]),
      events: Noizu.OpenAI.FineTune.Events.from_json(json[:events], json[:object]),
      fine_tuned_model: json[:fine_tuned_model],
      hyper_params: json[:hyperparams],
      organization_id: json[:organization_id],
      result_files: Noizu.OpenAI.Files.from_json(json[:result_files], json[:object]),
      status: json[:status],
      validation_files:  Noizu.OpenAI.Files.from_json(json[:validation_files], json[:object]),
      training_files: Noizu.OpenAI.Files.from_json(json[:training_files], json[:object]),
      updated_at: json[:updated_at] && DateTime.from_unix!(json[:updated_at])
    }
  end
end