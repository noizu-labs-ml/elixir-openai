
defmodule Noizu.OpenAI.Api.Completion do
  @moduledoc """
  Noizu.OpenAI.Api.Completion is a module that provides functionality for generating completions using
  OpenAI's API.

  This module offers one main function:

    1. `completion/2` - Generates a completion using the given prompt and options.

  ## Usage

      {:ok, completion_response} = Noizu.OpenAI.Api.Completion.completion(prompt, options)
  """

  require Noizu.OpenAI
  import Noizu.OpenAI

  #-------------------------------
  #
  #-------------------------------
  @doc """
  Generates a completion for the given prompt using the specified options.

  ## Parameters

  - prompt: The input text to generate a completion for
  - options: A map or keyword list of options for the API call, such as model, max_tokens, temperature, etc.

  ## Returns

  Returns a tuple {:ok, completion} on successful API call, where completion is the generated text completion.
  Returns {:error, term} on failure, where term contains error details.

  ## Example

      options = %{max_tokens: 50, temperature: 0.7}
      {:ok, completion} = Noizu.OpenAI.Api.Completion.completion("Once upon a time", options)
  """
  @type completion_response() :: map()
  @type completion_supported_models() :: :text_davinci_003 | :text_curie_003 | :text_babbage_003 | :text_ada_003
  @type completion_options() :: %{
                                  optional(:model) => Noizu.OpenAI.model_option(completion_supported_models()),
                                  optional(:suffix) => Noizu.OpenAI.stream_option(),
                                  optional(:max_tokens) => Noizu.OpenAI.max_tokens_option(),
                                  optional(:temperature) => Noizu.OpenAI.temperature_option(),
                                  optional(:top_p) => Noizu.OpenAI.top_p_option(),
                                  optional(:completions | :n) => Noizu.OpenAI.completions_option(),
                                  optional(:stream) => Noizu.OpenAI.stream_option(),
                                  optional(:logprobs) => Noizu.OpenAI.log_probability_option(),
                                  optional(:echo) => Noizu.OpenAI.echo_option(),
                                  optional(:stop) => Noizu.OpenAI.stop_option(),
                                  optional(:presence_penalty) => Noizu.OpenAI.presence_penalty_option(),
                                  optional(:frequency_penalty) => Noizu.OpenAI.frequency_penalty_option(),
                                  optional(:best_of) => Noizu.OpenAI.best_of_option(),
                                  optional(:logit_bias) => Noizu.OpenAI.logit_bias_option(),
                                  optional(:user) => Noizu.OpenAI.user_option(),
                                  optional(atom) => any,
                                } | Keyword.t()
  @spec completion(prompt :: String.t(), options :: completion_options()) :: {:ok, completion_response()} | {:error, term}
  def completion(prompt, options) do
    url = openai_base() <> "completions"
    body = %{prompt: prompt}
           |> put_field(:model, options, "text-davinci-003")
           |> put_field(:suffix, options, Application.get_env(:noizu_openai, :default_suffix))
           |> put_field(:max_tokens, options)
           |> put_field(:temperature, options)
           |> put_field(:top_p, options)
           |> put_field({:completions, :n}, options)
           |> put_field(:stream, options, false)
           |> put_field(:logprobs, options)
           |> put_field(:echo, options)
           |> put_field(:stop, options)
           |> put_field(:presence_penalty, options)
           |> put_field(:frequency_penalty, options)
           |> put_field(:best_of, options)
           |> put_field(:logit_bias, options)
           |> put_field(:user, options)
    api_call(:post, url, body, Noizu.OpenAI.Completion, options[:stream])
  end


end

