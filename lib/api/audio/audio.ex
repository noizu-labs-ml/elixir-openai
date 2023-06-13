
defmodule Noizu.OpenAI.Api.Audio do
  @moduledoc """
  Noizu.OpenAI.Api.Audio is a module that provides functionality for transcribing and translating audio using
  OpenAI's API.

  This module offers two main functions:

    1. `transcribe/3` - Transcribes the given audio file using a specified prompt and options.
    2. `translate/3` - Translates the given audio file using a specified prompt and options.

  ## Usage

      {:ok, transcript} = Noizu.OpenAI.Api.Audio.transcribe(audio, prompt, options)
      {:ok, translation} = Noizu.OpenAI.Api.Audio.translate(audio, prompt, options)
  """


  require Noizu.OpenAI
  import Noizu.OpenAI

  #-------------------------------
  #
  #-------------------------------
  @doc """
  Transcribes audio using the specified model.

  ## Parameters

  - audio: The URL of the audio file to transcribe
  - prompt: The prompt or instruction for the transcription
  - options: A map or keyword list of options, such as model, response_format, temperature, language, and stream

  ## Returns

  Returns a tuple {:ok, response} on successful transcription, where response is a map containing the transcription result.
  Returns {:error, term} on failure, where term contains error details.

  ## Example

      audio_url = "https://your_audio_url_here"
      prompt = "Transcribe this audio."
      {:ok, response} = Noizu.OpenAI.transcribe(audio_url, prompt)
  """
  @type transcribe_response() :: map()
  @type transcribe_supported_models() :: :"whisper-1" | atom
  @type transcribe_options() :: %{
                                  optional(:model) => Noizu.OpenAI.model_option(transcribe_supported_models()),
                                  optional(:response_format) => Noizu.OpenAI.response_format_option(),
                                  optional(:prompt) => String.t(),
                                  optional(:temperature) => Noizu.OpenAI.temperature_option(),
                                  optional(:language) => Noizu.OpenAI.language_option(),
                                  optional(:stream) => Noizu.OpenAI.stream_option(),
                                } | Keyword.t()
  @spec transcribe(audio :: String.t(), prompt :: String.t(), options :: transcribe_options()) :: {:ok, transcribe_response()} | {:error, term}
  def transcribe(audio, prompt, options \\ nil) do
    url = openai_base() <> "audio/transcriptions"
    body = %{file: audio}
           |> put_field(:model, options, "whisper-1")
           |> put_field(:response_format, options)
           |> put_field(:prompt, options, prompt)
           |> put_field(:temperature, options)
           |> put_field(:language, options)
    api_call(:post, url, body, Noizu.OpenAI.Audio.Transcript, options)
  end


  #-------------------------------
  #
  #-------------------------------
  @doc """
  Translates audio using the specified model.

  ## Parameters

  - audio: The URL of the audio file to translate
  - prompt: The prompt or instruction for the translation
  - options: A map or keyword list of options, such as model, response_format, temperature, and stream

  ## Returns

  Returns a tuple {:ok, response} on successful translation, where response is a map containing the translation result.
  Returns {:error, term} on failure, where term contains error details.

  ## Example

      audio_url = "https://your_audio_url_here"
      prompt = "Translate this audio to English."
      {:ok, response} = Noizu.OpenAI.translate_audio(audio_url, prompt)
  """
  @type translate_audio_response() :: map()
  @type translate_audio_supported_models() :: :"whisper-1" | atom
  @type translate_audio_options() :: %{
                                       optional(:model) => Noizu.OpenAI.model_option(translate_audio_supported_models()),
                                       optional(:response_format) => Noizu.OpenAI.response_format_option(),
                                       optional(:prompt) => String.t(),
                                       optional(:temperature) => Noizu.OpenAI.temperature_option(),
                                       optional(:stream) => Noizu.OpenAI.stream_option(),
                                     } | Keyword.t()
  @spec translate(audio :: String.t(), prompt :: String.t(), options :: translate_audio_options()) :: {:ok, translate_audio_response()} | {:error, term}
  def translate(audio, prompt, options \\ nil) do
    url = openai_base() <> "audio/translations"
    body = %{file: audio}
           |> put_field(:model, options, "whisper-1")
           |> put_field(:response_format, options)
           |> put_field(:prompt, options, prompt)
           |> put_field(:temperature, options)
    api_call(:post, url, body, Noizu.OpenAI.Audio.Transcript, options)
  end


end

