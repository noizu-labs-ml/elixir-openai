# Noizu.OpenAI.Api.Assistant

The `Noizu.OpenAI.Api.Assistant` module is part of the Noizu.OpenAI Elixir library and provides functionality to interact with the OpenAI API's assistant feature. The assistant feature allows you to create and manage conversational AI models that can be trained, updated, and used to generate human-like text responses.

## Usage

### Assistant Management

#### List Assistants

```elixir
Noizu.OpenAI.Api.Assistant.list(options)
```

Returns a list of all assistants in the user's organization.

#### Create Assistant

```elixir
Noizu.OpenAI.Api.Assistant.create(params, options)
```

Creates a new conversational AI assistant with the provided parameters.

#### Retrieve Assistant

```elixir
Noizu.OpenAI.Api.Assistant.get(id, options)
```

Fetches detailed information of a specific assistant by its ID.

#### Update Assistant

```elixir
Noizu.OpenAI.Api.Assistant.update(id, params, options)
```

Updates an existing assistant with the new parameters provided.

#### Delete Assistant

```elixir
Noizu.OpenAI.Api.Assistant.delete(id, options)
```

Deletes an assistant by its ID.

## Examples

To list available assistants:

```elixir
Noizu.OpenAI.Api.Assistant.list()
```

To create a new assistant:

```elixir
params = %{
  "model" => "curie",
  "settings" => %{ "max_tokens" => 150 }
}
Noizu.OpenAI.Api.Assistant.create(params)
```

To fetch an assistant by id:

```elixir
assistant_id = "assistant-id-123"
Noizu.OpenAI.Api.Assistant.get(assistant_id)
```

To update existing assistant:

```elixir
assistant_id = "assistant-id-123"
update_params = %{
  "name" => "Updated Assistant",
  "description" => "This assistant has been updated"
}
Noizu.OpenAI.Api.Assistant.update(assistant_id, update_params)
```

To delete an assistant:

```elixir
assistant_id = "assistant-id-123"
Noizu.OpenAI.Api.Assistant.delete(assistant_id)
```

## Additional Information

Use these functions to manage the lifecycle of your assistants, customizing them for various applications like customer service bots, in-game characters, educational tutors, and more.

For detailed information about assistant attributes, options, and expected return values, consult the Noizu.OpenAI library documentation and the official OpenAI API documentation.
