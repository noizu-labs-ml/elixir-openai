# Noizu.OpenAI.Api.Completion

This Elixir library provides a simple wrapper around OpenAI's Completions API. The Completions API allows you to generate one or more predicted completions for a given prompt. You can also receive the probabilities of alternative tokens at each position.

## Available Functions

### completion/2

This function creates a completion for the provided prompt and options.

```elixir
Noizu.OpenAI.Api.Completion.completion(prompt, options)
```

- `prompt`: The prompt to generate completions for.
- `options`: A keyword list or map with optional parameters.

## Usage

Here's an example of how to use the `completion/2` function:

```elixir
prompt = "Say this is a test"
options = [
  max_tokens: 7,
  temperature: 0
]
response = Noizu.OpenAI.Api.Completion.completion(prompt, options)
```