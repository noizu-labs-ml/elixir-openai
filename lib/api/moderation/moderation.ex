
defmodule Noizu.OpenAI.Api.Moderation do
  @moduledoc """
  Noizu.OpenAI.Api.Moderation is a module that provides functionality for content moderation using OpenAI's API.

  This module offers one main function:

    1. `create/2` - Moderates the given input content using the specified options.

  ## Usage

      {:ok, moderation_response} = Noizu.OpenAI.Api.Moderation.create(input, options)
  """

  # defmodule Noizu.OpenAI.Api.Embedding
  @moduledoc """
  Noizu.OpenAI.Api.Embedding is a module that provides functionality for generating embeddings using OpenAI's API.

  This module offers one main function:

    1. `create/2` - Generates an embedding for the given input content using the specified options.

  ## Usage

      {:ok, embedding_response} = Noizu.OpenAI.Api.Embedding.create(input, options)
  """

  require Noizu.OpenAI
  import Noizu.OpenAI

  #-------------------------------
  #
  #-------------------------------
  @doc """
  Performs content moderation using the OpenAI API.

  ## Parameters

  - input: The text content to be moderated
  - options: An optional keyword list or map containing model and stream options

  ## Returns

  Returns a tuple {:ok, moderation_response()} on successful moderation.
  Returns {:error, term} on failure, where term contains error details.

  ## Example

      text_to_moderate = "Text to moderate."
      {:ok, response} = Noizu.OpenAI.Api.Moderation.moderate(text_to_moderate)
  """
  @type moderation_response() :: map()
  @type moderation_options() :: %{
                                  optional(:model) => Noizu.OpenAI.model_option(atom),
                                  optional(:stream) => Noizu.OpenAI.stream_option(),
                                } | Keyword.t()
  @spec moderate(input :: String.t(), options :: moderation_options()) :: {:ok, moderation_response()} | {:error, term}
  def moderate(input, options \\ nil) do
    url = openai_base() <> "moderations"
    body = %{input: input}
           |> put_field(:model, options)
    api_call(:post, url, body, Noizu.OpenAI.Moderation, options)
  end

end
