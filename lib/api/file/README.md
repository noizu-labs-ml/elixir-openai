# Noizu.OpenAI.Api.File

Noizu.OpenAI.Api.File is an Elixir wrapper for OpenAI's API, specifically handling file operations. It provides functions for listing, uploading, deleting, retrieving file information, and retrieving file content.

## Available Functions

### List Files

```elixir
Noizu.OpenAI.Api.File.list(options \\ nil)
```

Returns a list of files that belong to the user's organization.

### Upload File

```elixir
Noizu.OpenAI.Api.File.create(file, options \\ nil)
```

Upload a file that contains document(s) to be used across various endpoints/features.

### Delete File

```elixir
Noizu.OpenAI.Api.File.delete(file, options \\ nil)
```

Delete a file.

### Retrieve File Information

```elixir
Noizu.OpenAI.Api.File.info(file, options \\ nil)
```

Returns information about a specific file.

### Retrieve File Content

```elixir
Noizu.OpenAI.Api.File.fetch(file, options \\ nil)
```

Returns the contents of the specified file.

Please refer to the OpenAI API documentation for detailed information about each API call and the expected parameters and responses.