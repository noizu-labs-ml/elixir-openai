defmodule Noizu.OpenAI.FineTuning.Jobs do
  @moduledoc """
  Represents a list of fine-tuning jobs.
  """
  @derive Jason.Encoder
  defstruct [
    :object,
    :data,
    :first_id,
    :last_id,
    :has_more
  ]

  @type t :: %__MODULE__{
               object: String.t(),
               data: list(Noizu.OpenAI.FineTuning.Job.t()),
               first_id: String.t(),
               last_id: String.t(),
               has_more: boolean()
             }

  def from_json(map) do
    %__MODULE__{
      object: map[:object],
      data: Enum.map(map[:data], &Noizu.OpenAI.FineTuning.Job.from_json/1),
      first_id: map[:first_id],
      last_id: map[:last_id],
      has_more: map[:has_more]
    }
  end
end
