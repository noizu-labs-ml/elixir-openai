defmodule Noizu.OpenAI.FineTuningJob do
  @moduledoc """
  Represents a fine-tuning job that has been created through the API.
  """
  defstruct [
    :id,
    :created_at,
    :error,
    :fine_tuned_model,
    :finished_at,
    :hyperparameters,
    :model,
    :object,
    :organization_id,
    :result_files,
    :status,
    :trained_tokens,
    :training_file,
    :validation_file
  ]

  @type t :: %__MODULE__{
               id: String.t(),
               created_at: integer(),
               error: map(),
               fine_tuned_model: String.t(),
               finished_at: integer() | nil,
               hyperparameters: map(),
               model: String.t(),
               object: String.t(),
               organization_id: String.t(),
               result_files: list(String.t()),
               status: String.t(),
               trained_tokens: integer() | nil,
               training_file: String.t(),
               validation_file: String.t() | nil
             }

  def from_json(map) do
    %__MODULE__{
      id: map["id"],
      created_at: map["created_at"],
      error: map["error"],
      fine_tuned_model: map["fine_tuned_model"],
      finished_at: map["finished_at"],
      hyperparameters: map["hyperparameters"],
      model: map["model"],
      object: map["object"],
      organization_id: map["organization_id"],
      result_files: map["result_files"],
      status: map["status"],
      trained_tokens: map["trained_tokens"],
      training_file: map["training_file"],
      validation_file: map["validation_file"]
    }
  end
end
