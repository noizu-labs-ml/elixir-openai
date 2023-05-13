defmodule Noizu.OpenAI.File do
  defstruct [:id, :object, :bytes, :created_at, :filename, :purpose]

  @type t :: %__MODULE__{
               id: String.t(),
               object: String.t(),
               bytes: integer,
               created_at: DateTime.t,
               filename: String.t(),
               purpose: String.t()
             }

  def from_json(%{id: id, object: object, bytes: bytes, created_at: created_at, filename: filename, purpose: purpose}) do
    %__MODULE__{
      id: id,
      object: object,
      bytes: bytes,
      created_at: created_at |> DateTime.from_unix!(),
      filename: filename,
      purpose: purpose
    }
  end
end