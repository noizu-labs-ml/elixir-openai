# Noizu.OpenAI

Noizu.OpenAI is an Elixir wrapper for the OpenAI API. It provides a simple and convenient way to interact with OpenAI's powerful AI models for tasks like text generation, completion, translation, image generation, and more.

## Installation

To install Noizu.OpenAI, add the following to your `mix.exs` file:

```elixir
defp deps do
  [
    {:noizu_openai, "~> 0.1.0"}
  ]
end
```

Then, run `mix deps.get` to fetch the dependencies.

## Configuration

To configure the Noizu.OpenAI, add the following to your `config.exs` or the appropriate environment-specific config file:

```elixir
config :noizu_openai,
  openai_api_key: "your_openai_api_key",
  openai_org: "your_openai_organization_id" # Optional
```

Replace `"your_openai_api_key"` with your actual OpenAI API key, and `"your_openai_organization_id"` with your OpenAI organization ID if applicable.

## Usage

Noizu.OpenAI provides modules for different OpenAI API endpoints:

- Noizu.OpenAI.Api.Audio
- Noizu.OpenAI.Api.Chat
- Noizu.OpenAI.Api.Completion
- Noizu.OpenAI.Api.Edit
- Noizu.OpenAI.Api.Embedding
- Noizu.OpenAI.Api.Engine
- Noizu.OpenAI.Api.File
- Noizu.OpenAI.Api.FineTune
- Noizu.OpenAI.Api.Image
- Noizu.OpenAI.Api.Model

Each module corresponds to a specific functionality provided by the OpenAI API. You can use the functions in these modules to interact with the respective API endpoints.

Here's an example of using the `Noizu.OpenAI.Api.Chat` module to generate a chatbot response:

```elixir
alias Noizu.OpenAI.Api.Chat

messages = [
  %{"role" => "system", "content" => "You are a helpful assistant."},
  %{"role" => "user", "content" => "Who won the world series in 2020?"},
]

{:ok, response} = Chat.chat(messages)
```

Refer to the documentation for each module to learn about the available functions and their usage.

## Documentation

You can generate the documentation for this project using ExDoc. Run `mix docs` and open the `doc/index.html` file in your browser.

## Tests

To run the tests for this project, use the command `mix test`.

## Contributing

If you'd like to contribute to the development of Noizu.OpenAI, please submit a pull request with your changes or open an issue to discuss your proposed changes.

## License

Noizu.OpenAI is released under the [MIT License](https://opensource.org/licenses/MIT).