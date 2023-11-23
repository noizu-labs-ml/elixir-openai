defmodule Noizu.OpenAI.DeleteStatus do
  @derive Jason.Encoder
  defstruct [:id, :object, :deleted]

  @type t :: %__MODULE__{
               id: String.t(),
               object: String.t(),
               deleted: boolean
             }

  def from_json(%{id: id, object: object, deleted: deleted}) do
    %__MODULE__{
      id: id,
      object: object,
      deleted: deleted
    }
  end
end
