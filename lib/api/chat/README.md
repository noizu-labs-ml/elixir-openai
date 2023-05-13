# Noizu.OpenAI.Api.Chat

The `Noizu.OpenAI.Api.Chat` module provides a simple wrapper for OpenAI API's chat completion feature. Given a list of messages describing a conversation, the model will return a response. The chat completion API can be used to create a model response for the given chat conversation.

## Usage

```elixir
Noizu.OpenAI.Api.Chat.chat(messages, options)
```

### Parameters

- `messages`: A list of messages describing the conversation so far.
- `options`: A keyword list or map of optional parameters to customize the chat completion request.

### Options

The following options can be passed in the `options` parameter:

- `:model`: ID of the model to use. Defaults to the value configured in the application environment or `"gpt-3.5-turbo"` if not set.
- `:temperature`: What sampling temperature to use, between 0 and 2.
- `:top_p`: An alternative to sampling with temperature, called nucleus sampling.
- `:completions` or `:n`: How many chat completion choices to generate for each input message.
- `:stream`: If set, partial message deltas will be sent, like in ChatGPT.
- `:stop`: Up to 4 sequences where the API will stop generating further tokens.
- `:max_tokens`: The maximum number of tokens to generate in the chat completion.
- `:presence_penalty`: Number between -2.0 and 2.0 to penalize new tokens based on whether they appear in the text so far.
- `:frequency_penalty`: Number between -2.0 and 2.0 to penalize new tokens based on their existing frequency in the text so far.
- `:logit_bias`: Modify the likelihood of specified tokens appearing in the completion.
- `:user`: A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse.

## Example

```elixir
messages = [%{role: "user", content: "Hello!"}]
options = [model: "gpt-3.5-turbo"]

response = Noizu.OpenAI.Api.Chat.chat(messages, options)
```
