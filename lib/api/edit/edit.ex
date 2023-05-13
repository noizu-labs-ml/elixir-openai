defmodule Noizu.OpenAI.Api.Edit do
  @moduledoc """
  Noizu.OpenAI.Api.Edit is a module that provides functionality for editing text using OpenAI's API.

  This module offers one main function:

    1. `edit/3` - Edits the given input text based on the specified instruction and options.

  ## Usage

      {:ok, edit_response} = Noizu.OpenAI.Api.Edit.edit(input, instruction, options)
  """


  require Noizu.OpenAI
  import Noizu.OpenAI

  #-------------------------------
  #
  #-------------------------------
  @doc """
  Generates an edit-based completion using the OpenAI API.

  ## Parameters

  - input: A string containing the input text
  - instruction: A string containing the editing instruction
  - options: An optional map or keyword list containing API options

  ## Returns

  Returns a tuple {:ok, response} on successful API call, where response is a map containing the edited text.
  Returns {:error, term} on failure, where term contains error details.

  ## Example

      input = "The sun rises in the est."
      instruction = "Fix the typo in this sentence."
      {:ok, response} = Noizu.OpenAI.Api.Edit.edit(input, instruction)
  """
  @type edit_response() :: map()
  @type edit_supported_models() :: :"code-davinci-edit-001" | atom
  @type edit_options() :: %{
                            optional(:model) => Noizu.OpenAI.model_option(edit_supported_models()),
                            optional(:completions | :n) => Noizu.OpenAI.completions_option(),
                            optional(:temperature) => Noizu.OpenAI.temperature_option(),
                            optional(:top_p) => Noizu.OpenAI.top_p_option(),
                            optional(:stream) => Noizu.OpenAI.stream_option(),
                          } | Keyword.t()
  @spec edit(input :: String.t(), instruction :: String.t(), options :: edit_options()) :: {:ok, edit_response()} | {:error, term}
  def edit(input, instruction, options \\ nil) do
    url = openai_base() <> "edits"
    body = %{input: input, instruction: instruction}
           |> put_field(:model, options,  Application.get_env(:noizu_openai, :default_edit_model, "code-davinci-edit-001"))
           |> put_field({:completions, :n}, options)
           |> put_field(:temperature, options)
           |> put_field(:top_p, options)
    api_call(:post, url, body, Noizu.OpenAI.Edit, options[:stream])
  end


end

