# Noizu.OpenAI.Api.Thread

The `Noizu.OpenAI.Api.Thread` module within the Noizu.OpenAI library provides functionality to manage and interact with threads via the OpenAI API. Using this module, developers can create, list, delete, and perform operations on individual messages within threads, as well as manage run executions associated with a thread.

## Usage

### Thread Management

#### List Threads

```elixir
Noizu.OpenAI.Api.Thread.list()
```

Returns a list of threads associated with your account.

#### Create Thread

```elixir
Noizu.OpenAI.Api.Thread.create(attrs)
```

Creates a new thread with the provided attributes.

#### Retrieve Thread

```elixir
Noizu.OpenAI.Api.Thread.get(thread_id)
```

Fetches details of a specific thread by its ID.

#### Update Thread

```elixir
Noizu.OpenAI.Api.Thread.update(thread_id, attrs)
```

Updates a specific thread by its ID with the provided attributes.

#### Delete Thread

```elixir
Noizu.OpenAI.Api.Thread.delete(thread_id)
```

Deletes a specific thread by its ID.

### Thread.Message API

#### List Messages

```elixir
Noizu.OpenAI.Api.Thread.Message.list(thread_id)
```

Lists all messages belonging to the specified thread.

#### Create Message

```elixir
Noizu.OpenAI.Api.Thread.Message.create(thread_id, attrs)
```

Creates a new message in the given thread with the specified attributes.

#### Retrieve Message

```elixir
Noizu.OpenAI.Api.Thread.Message.get(thread_id, message_id)
```

Fetches a single message by its ID from a specific thread.

#### Update Message

```elixir
Noizu.OpenAI.Api.Thread.Message.update(thread_id, message_id, attrs)
```

Updates a message within a thread based on its ID with the provided attributes.

#### Delete Message

```elixir
Noizu.OpenAI.Api.Thread.Message.delete(thread_id, message_id)
```

Deletes a message from a specific thread by its ID.

### Thread.Run API

#### List Runs

```elixir
Noizu.OpenAI.Api.Thread.Run.list(thread_id)
```

Lists all runs belonging to a specified thread.

#### Create Run

```elixir
Noizu.OpenAI.Api.Thread.Run.create(thread_id, attrs)
```

Initiates a run within the given thread using the provided attributes.

#### Retrieve Run

```elixir
Noizu.OpenAI.Api.Thread.Run.get(thread_id, run_id)
```

Retrieves details of a specific run by its ID within a thread.

#### Update Run

```elixir
Noizu.OpenAI.Api.Thread.Run.update(thread_id, run_id, attrs)
```

Updates a run within a thread based on its ID with the specified attributes.

#### Cancel Run

```elixir
Noizu.OpenAI.Api.Thread.Run.cancel(thread_id, run_id)
```

Cancels a run that is in progress within the specified thread.

#### Submit Tool Outputs

```elixir
Noizu.OpenAI.Api.Thread.Run.submit_tool_outputs(thread_id, run_id, outputs)
```

Submits tool outputs to a run requiring action within a specific thread.

## Notes

Use these API calls to build sophisticated workflows that simulate and extend conversation-like interactions with the OpenAI service. By creating threads, you can maintain a coherent context and history for interactions, thus enabling more complex and stateful conversation patterns.

---

For additional details on the expected behavior, parameters, and returns of these functions, please refer to the Noizu.OpenAI library documentation or the OpenAI API official documentation.
