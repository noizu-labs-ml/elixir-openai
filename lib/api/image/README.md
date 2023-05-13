# Noizu.OpenAI.Api.Image

`Noizu.OpenAI.Api.Image` is a module that provides simple functions to interact with OpenAI's Image API. This module allows you to generate images, edit images, and create image variations using OpenAI's API.

## Functions

- `create/2`: Generates new images given a text description (prompt)
- `edit/3`: Edits or extends an image given an original image and a text description (prompt)
- `variation/2`: Creates a variation of a given image

## Usage

### Create Image

```elixir
Noizu.OpenAI.Api.Image.create(prompt, options)
```

- `prompt`: A text description of the desired image(s). The maximum length is 1000 characters.
- `options`: A map or keyword list of optional parameters

Example:

```elixir
Noizu.OpenAI.Api.Image.create("A cute baby sea otter", %{n: 2, size: "1024x1024"})
```

### Create Image Edit

```elixir
Noizu.OpenAI.Api.Image.edit(image, prompt, options)
```

- `image`: The image to edit. Must be a valid PNG file, less than 4MB, and square.
- `prompt`: A text description of the desired image(s). The maximum length is 1000 characters.
- `options`: A map or keyword list of optional parameters

Example:

```elixir
Noizu.OpenAI.Api.Image.edit("image_file_path", "A cute baby sea otter wearing a beret", %{n: 2, size: "1024x1024"})
```

### Create Image Variation

```elixir
Noizu.OpenAI.Api.Image.variation(image, options)
```

- `image`: The image to use as the basis for the variation(s). Must be a valid PNG file, less than 4MB, and square.
- `options`: A map or keyword list of optional parameters

Example:

```elixir
Noizu.OpenAI.Api.Image.variation("image_file_path", %{n: 2, size: "1024x1024"})
```

For more details on the API endpoints, request parameters, and response format, please refer to OpenAI's [API documentation](https://beta.openai.com/docs/api-reference/images/).