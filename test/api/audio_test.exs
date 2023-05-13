
defmodule Noizu.OpenAI.Api.AudioTest do
  use ExUnit.Case
  @moduletag :audio

  describe "transcribe/3" do
    test "successful transcription" do
      audio = "/path/to/file/audio.mp3"
      prompt = "transcribe this audio"
      response = %Noizu.OpenAI.Audio.Transcript{text: "Hey"}
      Mimic.expect(Finch, :request, fn(_, _, _) -> {:ok, %Finch.Response{status: 200, body: "{\"text\": \"Hey\"}"}} end)
      {:ok, result} = Noizu.OpenAI.Api.Audio.transcribe(audio, prompt)


      assert response == result
    end
  end

  describe "translate/3" do
    test "successful translation" do
      audio = "/path/to/file/german.m4a"
      prompt = "translate this audio"
      response = %Noizu.OpenAI.Audio.Transcript{text: "Hey"}
      Mimic.expect(Finch, :request, fn(_, _, _) -> {:ok, %Finch.Response{status: 200, body: "{\"text\": \"Hey\"}"}} end)

      {:ok, result} = Noizu.OpenAI.Api.Audio.translate(audio, prompt)

      assert response == result
    end
  end
end