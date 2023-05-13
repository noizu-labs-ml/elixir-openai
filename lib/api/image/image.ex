
defmodule Noizu.OpenAI.Api.Image do
  @moduledoc """
  Noizu.OpenAI.Api.Image is a module that provides functionality for generating and editing images using OpenAI's API.

  This module offers three main functions:

    1. `create/2` - Creates a new image using the given prompt and options.
    2. `edit/3` - Edits the given image based on the specified prompt and options.
    3. `variation/3` - Generates a variation of the given image using the specified prompt and options.

  ## Usage

      {:ok, image} = Noizu.OpenAI.Api.Image.create(prompt, options)
      {:ok, edited_image} = Noizu.OpenAI.Api.Image.edit(image, prompt, options)
      {:ok, image_variation} = Noizu.OpenAI.Api.Image.variation(image, prompt, options)
  """


  require Noizu.OpenAI
  import Noizu.OpenAI

  #-------------------------------
  #
  #-------------------------------
  @doc """
  Generates an image using the OpenAI API.

  ## Parameters

  - prompt: A string containing the prompt for the image
  - options: An optional map or keyword list containing API options

  ## Returns

  Returns a tuple {:ok, response} on successful API call, where response is a map containing the generated image.
  Returns {:error, term} on failure, where term contains error details.

  ## Example

      prompt = "A beautiful sunset over the beach with palm trees"
      {:ok, response} = Noizu.OpenAI.image(prompt)
  """
  @type image_response() :: map()
  @type image_options() :: %{
                             optional(:completions | :n) => Noizu.OpenAI.completions_option(),
                             optional(:size) => Noizu.OpenAI.size_option(),
                             optional(:response_format) => Noizu.OpenAI.response_format_option(),
                             optional(:user) => Noizu.OpenAI.user_option(),
                             optional(:stream) => Noizu.OpenAI.stream_option(),
                           } | Keyword.t()
  @spec create(prompt :: String.t(), options :: image_options()) :: {:ok, image_response()} | {:error, term}
  def create(prompt, options \\ nil) do
    url = openai_base() <> "images/generations"
    body = %{prompt: prompt}
           |> put_field({:completions, :n}, options)
           |> put_field(:size, options)
           |> put_field(:response_format, options)
           |> put_field(:user, options)
    api_call(:post, url, body, Noizu.OpenAI.Images, options[:stream])
  end


  #-------------------------------
  #
  #-------------------------------
  @doc """
  Generates a new image by editing an existing image based on the provided prompt.

  ## Parameters

  - image: The URL of the existing image to be edited
  - prompt: The text prompt describing the desired edit
  - options: A map or keyword list of optional parameters (e.g., :mask, :completions, :size, :response_format, :user, :stream)

  ## Returns

  Returns a tuple {:ok, response} on successful API call, where response is a map containing the generated image information.
  Returns {:error, term} on failure, where term contains error details.

  ## Example

      image_url = "https://example.com/your_image.jpg"
      prompt = "Add a spaceship flying in the sky."
      {:ok, response} = Noizu.OpenAI.image_edit(image_url, prompt)
  """
  @type image_edit_response() :: map()
  @type image_edit_options() :: %{
                                  optional(:mask) => Noizu.OpenAI.mask_option(),
                                  optional(:completions | :n) => Noizu.OpenAI.completions_option(),
                                  optional(:size) => Noizu.OpenAI.size_option(),
                                  optional(:response_format) => Noizu.OpenAI.response_format_option(),
                                  optional(:user) => Noizu.OpenAI.user_option(),
                                  optional(:stream) => Noizu.OpenAI.stream_option(),
                                } | Keyword.t()
  @spec edit(image :: String.t(), prompt :: String.t(), options :: image_edit_options()) :: {:ok, image_edit_response()} | {:error, term}
  def edit(image, prompt, options \\ nil) do
    url = openai_base() <> "images/generations"
    body = %{image: image, prompt: prompt}
           |> put_field(:mask, options)
           |> put_field({:completions, :n}, options)
           |> put_field(:size, options)
           |> put_field(:response_format, options)
           |> put_field(:user, options)
    api_call(:post, url, body, Noizu.OpenAI.Images, options[:stream])
  end


  #-------------------------------
  #
  #-------------------------------
  @doc """
  Generates a new image variation based on an existing image and the provided prompt.

  ## Parameters

  - image: The URL of the existing image to be varied
  - prompt: The text prompt describing the desired variation
  - options: A map or keyword list of optional parameters (e.g., :completions, :size, :response_format, :user, :stream)

  ## Returns

  Returns a tuple {:ok, response} on successful API call, where response is a map containing the generated image variation information.
  Returns {:error, term} on failure, where term contains error details.

  ## Example

      image_url = "https://example.com/your_image.jpg"
      prompt = "A different version of the image with more clouds in the sky."
      {:ok, response} = Noizu.OpenAI.image_variation(image_url, prompt)
  """
  @type image_variation_response() :: map()
  @type image_variation_options() :: %{
                                       optional(:completions | :n) => Noizu.OpenAI.completions_option(),
                                       optional(:size) => Noizu.OpenAI.size_option(),
                                       optional(:response_format) => Noizu.OpenAI.response_format_option(),
                                       optional(:user) => Noizu.OpenAI.user_option(),
                                       optional(:stream) => Noizu.OpenAI.stream_option(),
                                     } | Keyword.t()
  @spec variation(image :: String.t(), prompt :: String.t(), options :: image_variation_options()) :: {:ok, image_variation_response()} | {:error, term}
  def variation(image, prompt, options \\ nil) do
    url = openai_base() <> "images/variations"
    body = %{image: image, prompt: prompt}
           |> put_field({:completions, :n}, options)
           |> put_field(:size, options)
           |> put_field(:response_format, options)
           |> put_field(:user, options)
    api_call(:post, url, body, Noizu.OpenAI.Images, options[:stream])
  end


end



