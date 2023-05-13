

defmodule Noizu.OpenAI.Api.File do
  @moduledoc """
  Noizu.OpenAI.Api.File is a module that provides functionality for managing files using OpenAI's API.

  This module offers several functions for file management:

    1. `list/1` - Lists all the files.
    2. `info/2` - Retrieves information about a specific file.
    3. `fetch/2` - Fetches the content of a specific file.
    4. `create/2` - Creates a new file with the given file and options.
    5. `delete/2` - Deletes a specific file.

  ## Usage

      {:ok, files} = Noizu.OpenAI.Api.File.list(options)
      {:ok, file_info} = Noizu.OpenAI.Api.File.info(file, options)
      {:ok, file_content} = Noizu.OpenAI.Api.File.fetch(file, options)
      {:ok, new_file} = Noizu.OpenAI.Api.File.create(file, options)
      {:ok, deleted_file} = Noizu.OpenAI.Api.File.delete(file, options)
  """

  require Noizu.OpenAI
  import Noizu.OpenAI

  #-------------------------------
  #
  #-------------------------------
  @doc """
  Fetches a list of files from the OpenAI API.

  ## Parameters

  - options: A map or keyword list of options, such as stream (for streaming API calls)

  ## Returns

  Returns a tuple {:ok, response} on successful retrieval, where response is a map containing the list of files.
  Returns {:error, term} on failure, where term contains error details.

  ## Example

      {:ok, response} = Noizu.OpenAI.Api.File.list()
  """
  @type files_response() :: map()
  @type files_options() :: Noizu.OpenAI.stream_options()
  @spec list(files_options) :: {:ok, files_response()} | {:error, term}
  def list(options \\ nil) do
    url = openai_base() <> "files"
    body = nil
    api_call(:get, url, body, Noizu.OpenAI.Files, options[:stream])
  end


  #-------------------------------
  #
  #-------------------------------
  @doc """
  Fetches a list of files from the OpenAI API.

  ## Parameters

  - options: A map or keyword list of options, such as stream (for streaming API calls)

  ## Returns

  Returns a tuple {:ok, response} on successful retrieval, where response is a map containing the list of files.
  Returns {:error, term} on failure, where term contains error details.

  ## Example

      {:ok, response} = Noizu.OpenAI.Api.File.info()
  """
  @type file_info_response() :: map()
  @type file_info_options() :: Noizu.OpenAI.stream_options()
  @spec info(file_id :: String.t(), file_info_options()) :: {:ok, file_info_response()} | {:error, term}
  def info(file, options \\ nil) do
    url = openai_base() <> "files/#{file}"
    body = nil
    api_call(:get, url, body, Noizu.OpenAI.File, options[:stream])
  end


  #-------------------------------
  #
  #-------------------------------
  @doc """
  Retrieves the content of a specific file by its ID from the OpenAI API.

  ## Parameters

  - file: The ID of the file to retrieve content from
  - options: Optional keyword list or map containing stream options

  ## Returns

  Returns a tuple {:ok, file_response()} on success, where file_response() is a map containing file content.
  Returns {:error, term} on failure, where term contains error details.
  """
  @type file_response() :: map()
  @type file_options() :: Noizu.OpenAI.stream_options()
  @spec fetch(file :: String.t(), file_options) :: {:ok, file_response()} | {:error, term}
  def fetch(file, options \\ nil) do
    url = openai_base() <> "files/#{file}/content"
    body = nil
    api_call(:get, url, body, Noizu.OpenAI.File.Content, options[:stream], raw: true)
  end


  #-------------------------------
  #
  #-------------------------------
  @doc """
  Uploads a file to OpenAI's API for use in various features like fine-tuning.

  ## Parameters

  - file: The URL of the file to be uploaded
  - options: A keyword list or map containing optional parameters
      - :purpose (String.t()): The purpose of the uploaded file (e.g., "fine-tuning")
      - :stream (boolean): A boolean value to indicate whether the request should be processed as a stream or not (default: false)

  ## Returns

  Returns a tuple {:ok, upload_file_response()} on successful file upload, where upload_file_response() is a map containing the response data.
  Returns {:error, term} on failure, where term contains error details.

  ## Example

      file_url = "https://example.com/my_file.txt"
      options = [purpose: "fine-tuning"]
      {:ok, response} = Noizu.OpenAI.upload_file(file_url, options)
  """
  @type upload_file_response() :: map()
  @type upload_file_options() :: %{
                                   optional(:purpose) => Noizu.OpenAI.purpose_option(),
                                   optional(:stream) => Noizu.OpenAI.stream_option(),
                                 } | Keyword.t()
  @spec create(file :: String.t(), options :: upload_file_options()) :: {:ok, upload_file_response()} | {:error, term}
  def create(file, options \\ nil) do
    url = openai_base() <> "files"
    body = %{file: file}
           |> put_field(:purpose, options)
    api_call(:post, url, body, Noizu.OpenAI.File, options[:stream])
  end


  #-------------------------------
  #
  #-------------------------------
  @doc """
  Deletes a file from the OpenAI API.

  ## Parameters

  - file: The ID of the file to be deleted
  - options: An optional keyword list or map containing stream options

  ## Returns

  Returns a tuple {:ok, delete_file_response()} on successful file deletion.
  Returns {:error, term} on failure, where term contains error details.

  ## Example

      file_id = "your_file_id_here"
      {:ok, response} = Noizu.OpenAI.delete_file(file_id)
  """
  @type delete_file_response() :: map()
  @type delete_file_options() :: Noizu.OpenAI.stream_options()
  @spec delete(file :: String.t(), delete_file_options) :: {:ok, delete_file_response()} | {:error, term}
  def delete(file, options \\ nil) do
    url = openai_base() <> "files/#{file}"
    body = nil
    api_call(:delete, url, body, Noizu.OpenAI.File.Delete, options[:stream])
  end


end

