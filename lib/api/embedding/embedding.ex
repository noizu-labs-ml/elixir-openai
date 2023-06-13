defmodule Noizu.OpenAI.Api.Embedding do
  require Noizu.OpenAI
  import Noizu.OpenAI

  #-------------------------------
  #
  #-------------------------------
  @doc """
  Generates embeddings for a list of strings using the specified model.

  ## Parameters

  - input: A list of strings for which embeddings are to be generated
  - options: A map or keyword list of optional parameters (e.g., :model, :user)

  ## Returns

  Returns a tuple {:ok, response} on successful API call, where response is a map containing the generated embeddings.
  Returns {:error, term} on failure, where term contains error details.

  ## Example

      input = ["apple", "orange", "banana"]
      {:ok, response} = Noizu.OpenAI.embeddings(input)
  """
  @type embeddings_response() :: map()
  @type embeddings_supported_models :: :"text-embedding-ada-002"
  @type embeddings_options() :: %{
                                  optional(:model) => Noizu.OpenAI.model_option(embeddings_supported_models()),
                                  optional(:user) => Noizu.OpenAI.user_option()
                                } | Keyword.t()
  @spec create(input :: String.t(), embeddings_options) :: {:ok, embeddings_response()} | {:error, term}
  def create(input, options \\ nil) do
    url = openai_base() <> "embeddings"
    body = %{input: input}
           |> put_field(:model, options, "text-embedding-ada-002")
           |> put_field(:user, options)
    api_call(:post, url, body, Noizu.OpenAI.Embeddings, options)
  end


end

