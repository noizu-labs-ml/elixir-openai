defmodule Noizu.OpenAI.Api.FileTest do
  use ExUnit.Case
  @moduletag :openai_file

  describe "list/1" do
    test "successful file listing" do
      file = %Noizu.OpenAI.File{
        id: "file_id",
        object: "file",
        bytes: 12345,
        created_at: ~U[1973-11-29 21:33:09Z],
        filename: "example.txt",
        purpose: "fine-tuning"
      }
      response = %Noizu.OpenAI.Files{list: [file], object: "list"}

      Mimic.expect(Finch, :request, fn(_, _, _) -> {:ok, %Finch.Response{status: 200, body: "{\"data\": [{\"id\": \"file_id\", \"object\": \"file\", \"bytes\": 12345, \"created_at\": 123456789, \"filename\": \"example.txt\", \"purpose\": \"fine-tuning\"}], \"object\": \"list\"}"}} end)

      {:ok, result} = Noizu.OpenAI.Api.File.list()

      assert response == result
    end
  end

  describe "info/2" do
    test "successful file information retrieval" do
      file = %Noizu.OpenAI.File{
        id: "file_id",
        object: "file",
        bytes: 12345,
        created_at: ~U[1973-11-29 21:33:09Z],
        filename: "example.txt",
        purpose: "fine-tuning"
      }

      Mimic.expect(Finch, :request, fn(_, _, _) -> {:ok, %Finch.Response{status: 200, body: "{\"id\": \"file_id\", \"object\": \"file\", \"bytes\": 12345, \"created_at\": 123456789, \"filename\": \"example.txt\", \"purpose\": \"fine-tuning\"}"}} end)

      {:ok, result} = Noizu.OpenAI.Api.File.info("file_id")

      assert file == result
    end
  end

  describe "fetch/2" do
    test "successful file content fetch" do
      file_content = "This is an example file content."

      Mimic.expect(Finch, :request, fn(_, _, _) -> {:ok, %Finch.Response{status: 200, body: file_content}} end)

      {:ok, result} = Noizu.OpenAI.Api.File.fetch("file_id")

      assert %Noizu.OpenAI.File.Content{binary: file_content} == result
    end
  end

  describe "create/2" do
    test "successful file creation" do
      file = %Noizu.OpenAI.File{
        id: "file_id",
        object: "file",
        bytes: 12345,
        created_at: ~U[1973-11-29 21:33:09Z],
        filename: "example.txt",
        purpose: "fine-tuning"
      }
      file_url = "https://example.com/my_file.txt"
      options = [purpose: "fine-tuning"]

      Mimic.expect(Finch, :request, fn(_, _, _) -> {:ok, %Finch.Response{status: 200, body: "{\"id\": \"file_id\", \"object\": \"file\", \"bytes\": 12345, \"created_at\": 123456789, \"filename\": \"example.txt\", \"purpose\": \"fine-tuning\"}"}} end)

      {:ok, result} = Noizu.OpenAI.Api.File.create(file_url, options)

      assert file == result
    end
  end

  describe "delete/2" do
    test "successful file deletion" do
      deleted_file = %Noizu.OpenAI.File.Delete{
        id: "file_id",
        object: "file",
        deleted: true
      }

      Mimic.expect(Finch, :request, fn(_, _, _) -> {:ok, %Finch.Response{status: 200, body: "{\"id\": \"file_id\", \"object\": \"file\", \"deleted\": true}"}} end)

      {:ok, result} = Noizu.OpenAI.Api.File.delete("file_id")

      assert deleted_file == result
    end
  end
end