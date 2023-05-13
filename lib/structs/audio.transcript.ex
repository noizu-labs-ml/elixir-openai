defmodule Noizu.OpenAI.Audio.Transcript do
  @moduledoc """
  Struct representing an Audio Transcript from the OpenAI API.
  """
  @type t :: %__MODULE__{
               text: String.t()
             }

  defstruct [:text]

  @doc """
  Convert a JSON map with atom keys to a Noizu.OpenAI.AudioTranscript struct.
  """
  def from_json(json) do
    %__MODULE__{
      text: json[:text]
    }
  end
end