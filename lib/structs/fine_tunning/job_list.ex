defmodule Noizu.OpenAI.FineTuningJobList do
  @moduledoc """
  Represents a list of fine-tuning jobs.
  """
  defstruct [
    :object,
    :data,
    :has_more
  ]

  @type t :: %__MODULE__{
               object: String.t(),
               data: list(Noizu.OpenAI.FineTuningJob.t()),
               has_more: boolean()
             }

  def from_json(map) do
    %__MODULE__{
      object: map["object"],
      data: Enum.map(map["data"], &Noizu.OpenAI.FineTuningJob.from_json/1),
      has_more: map["has_more"]
    }
  end
end
