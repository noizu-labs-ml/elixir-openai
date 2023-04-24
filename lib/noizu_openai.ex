defmodule NoizuLabs.OpenAI do
  @moduledoc """
  NoizuLabs.OpenAI keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  @openai_base "https://api.openai.com/v1/"
  require Logger
  defp headers() do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{Application.get_env(:noizu_openai, :openai_api_key)}"}
    ] |> then(
           fn(headers) ->
             if org = Application.get_env(:noizu_openai, :openai_org) do
               headers ++ [{"OpenAI-Organization", org}]
             else
               headers
             end
           end
         )
  end

  defp put_field(body, field, options, default \\ nil)
  defp put_field(body, {field_alias, field}, options, default) do
    if v = options[field_alias] || options[field] || default do
      Map.put(body, field, v)
    else
      body
    end
  end
  defp put_field(body, field, options, default) do
    if v = options[field] || default do
      Map.put(body, field, v)
    else
      body
    end
  end

  defp api_call_fetch(type, url, body) do
    Finch.build(type, url, headers(), body, timeout: 60_000)
    |> Finch.request(NoizuLabs.OpenAI.Finch)
  end

  defp api_call(type, url, body, model) do
    payload =  %{
      type: type,
      url: url,
      body: body,
      model: model
    }
   Logger.info("API REQUEST:\n#{inspect payload}")

    with {:ok, %Finch.Response{status: 200, body: body}},
         {:ok, body} <- body && Jason.encode(body) || {:ok, nil},
         {:ok, %Finch.Response{status: 200, body: body}} <- api_call_fetch(type, url, body),
         {:ok, json} <- Jason.decode(body, keys: :atoms) do
      {:ok, json}
      #apply(model, :from_json, [json])
      else
      error ->
      Logger.warn("API ERROR: \n #{inspect error}")
    end
  end

  def models() do
    url = @openai_base <> "models"
    api_call(:get, url, nil, NoizuLabs.OpenAI.Models)
  end

  def model(model) do
    url = @openai_base <> "models/#{model}"
    api_call(:get, url, nil, NoizuLabs.OpenAI.Model)
  end


  def completion(prompt, options) do
    url = @openai_base <> "completions"
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
    api_call(:post, url, body, NoizuLabs.OpenAI.Completion)
  end

  def chat(messages, options \\ nil) do
    url = @openai_base <> "chat/completions"
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
    api_call(:post, url, body, NoizuLabs.OpenAI.Chat)
  end


  def edit(input, instruction, options \\ nil) do
    url = @openai_base <> "edits"
    body = %{input: input, instruction: instruction}
           |> put_field(:model, options,  Application.get_env(:noizu_openai, :default_edit_model, "code-davinci-edit-001"))
           |> put_field({:completions, :n}, options)
           |> put_field(:temperature, options)
           |> put_field(:top_p, options)
    api_call(:post, url, body, NoizuLabs.OpenAI.Edit)
  end



  def image(prompt, options \\ nil) do
    url = @openai_base <> "images/generations"
    body = %{prompt: prompt}
           |> put_field({:completions, :n}, options)
           |> put_field(:size, options)
           |> put_field(:response_format, options)
           |> put_field(:user, options)
    api_call(:post, url, body, NoizuLabs.OpenAI.Image)
  end



  def image_edit(image, prompt, options \\ nil) do
    url = @openai_base <> "images/generations"
    body = %{image: image, prompt: prompt}
           |> put_field(:mask, options)
           |> put_field({:completions, :n}, options)
           |> put_field(:size, options)
           |> put_field(:response_format, options)
           |> put_field(:user, options)
    api_call(:post, url, body, NoizuLabs.OpenAI.ImageEdit)
  end


  def image_variation(image, prompt, options \\ nil) do
    url = @openai_base <> "images/variations"
    body = %{image: image, prompt: prompt}
           |> put_field({:completions, :n}, options)
           |> put_field(:size, options)
           |> put_field(:response_format, options)
           |> put_field(:user, options)
    api_call(:post, url, body, NoizuLabs.OpenAI.ImageVariation)
  end

  def embeddings(input, options \\ nil) do
    url = @openai_base <> "embeddings"
    body = %{input: input}
           |> put_field(:model, options)
           |> put_field(:user, options)
    api_call(:post, url, body, NoizuLabs.OpenAI.Completion)
  end

  def transcribe(audio, prompt, options \\ nil) do
    url = @openai_base <> "audio/transcriptions"
    body = %{file: audio}
           |> put_field(:model, options, "whisper-1")
           |> put_field(:response_format, options)
           |> put_field(:prompt, options, prompt)
           |> put_field(:temperature, options)
           |> put_field(:language, options)
    api_call(:post, url, body, NoizuLabs.OpenAI.Transcription)
  end


  def translate_audio(audio, prompt, options \\ nil) do
    url = @openai_base <> "audio/translations"
    body = %{file: audio}
           |> put_field(:model, options, "whisper-1")
           |> put_field(:response_format, options)
           |> put_field(:prompt, options, prompt)
           |> put_field(:temperature, options)
    api_call(:post, url, body, NoizuLabs.OpenAI.Translation)
  end


  def files(_options \\ nil) do
    url = @openai_base <> "files"
    body = nil
    api_call(:get, url, body, NoizuLabs.OpenAI.Files)
  end


  def file_info(file, _options \\ nil) do
    url = @openai_base <> "files/#{file}"
    body = nil
    api_call(:get, url, body, NoizuLabs.OpenAI.File)
  end

  def file(file, _options \\ nil) do
    url = @openai_base <> "files/#{file}/content"
    body = nil
    api_call(:get, url, body, NoizuLabs.OpenAI.File)
  end

  def upload_file(file, options \\ nil) do
    url = @openai_base <> "files"
    body = %{file: file}
           |> put_field(:purpose, options)
    api_call(:post, url, body, NoizuLabs.OpenAI.File)
  end

  def delete_file(file, _options \\ nil) do
    url = @openai_base <> "files/#{file}"
    body = nil
    api_call(:delete, url, body, NoizuLabs.OpenAI.DeleteFile)
  end

  def moderation(input, options \\ nil) do
    url = @openai_base <> "moderations"
    body = %{input: input}
           |> put_field(:model, options)
    api_call(:post, url, body, NoizuLabs.OpenAI.Moderation)
  end

end
