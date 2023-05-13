
defmodule Noizu.OpenAI.Api.Chat do
  @moduledoc """
  Noizu.OpenAI.Api.Chat is a module that provides functionality for handling chat-based interactions using
  OpenAI's API.

  This module offers one main function:

    1. `chat/2` - Generates a chat-based completion using the given messages and options.

  ## Usage

      {:ok, chat_response} = Noizu.OpenAI.Api.Chat.chat(messages, options)
  """

  require Noizu.OpenAI
  import Noizu.OpenAI

  #-------------------------------
  #
  #-------------------------------
  @doc """
  Generates a chat-based completion using the OpenAI API.

  ## Parameters

  - messages: A list of maps containing message role and content
  - options: An optional map or keyword list containing API options

  ## Returns

  Returns a tuple {:ok, response} on successful API call, where response is a map containing the chat response.
  Returns {:error, term} on failure, where term contains error details.

  ## Example

      messages = [
        %{"role" => "system", "content" => "You are a helpful assistant."},
        %{"role" => "user", "content" => "Who won the world series in 2020?"}
      ]
      {:ok, response} = Noizu.OpenAI.Api.Chat.chat(messages)
  """
  @type chat_response() :: map()
  @type chat_supported_models() :: :"gpt-3.5-turbo" | :gpt4 | atom
  @type chat_options() :: %{
                            optional(:model) => Noizu.OpenAI.model_option(chat_supported_models()),
                            optional(:temperature) => Noizu.OpenAI.temperature_option(),
                            optional(:top_p) => Noizu.OpenAI.top_p_option(),
                            optional(:completions | :n) => Noizu.OpenAI.completions_option(),
                            optional(:stream) => Noizu.OpenAI.stream_option(),
                            optional(:stop) => Noizu.OpenAI.stop_option(),
                            optional(:max_tokens) => Noizu.OpenAI.max_tokens_option(),
                            optional(:presence_penalty) => Noizu.OpenAI.presence_penalty_option(),
                            optional(:logit_bias) => Noizu.OpenAI.logit_bias_option(),
                            optional(:user) => Noizu.OpenAI.user_option(),
                          } | Keyword.t()
  @type chat_message :: %{:role => String.t, :message => String.t}
  @spec chat(messages :: list(chat_message), options :: chat_options()) :: {:ok, chat_response()} | {:error, term}
  def chat(messages, options \\ nil) do
    url = openai_base() <> "chat/completions"
    body = %{messages: messages}
           |> put_field(:model, options,  Application.get_env(:noizu_openai, :default_chat_model, "gpt-3.5-turbo"))
           |> put_field(:temperature, options)
           |> put_field(:top_p, options)
           |> put_field({:completions, :n}, options)
           |> put_field(:stream, options, false)
           |> put_field(:stop, options)
           |> put_field(:max_tokens, options)
           |> put_field(:presence_penalty, options)
           |> put_field(:logit_bias, options)
           |> put_field(:user, options)
    api_call(:post, url, body, Noizu.OpenAI.Chat, options[:stream])
  end


end
