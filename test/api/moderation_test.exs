defmodule Noizu.OpenAI.Api.ModerationTest do
  use ExUnit.Case
  @moduletag :moderation

  describe "moderate/1" do
    test "successful moderation" do
      text = "This is a test text for moderation."
      response =  %Noizu.OpenAI.Moderation{
        id: "modr-5MWoLO",
        model: "text-moderation-001",
        results: [
          %Noizu.OpenAI.Moderation.Result{
            categories: %Noizu.OpenAI.Moderation.Category{
              hate: false,
              hate_threatening: true,
              self_harm: false,
              sexual: false,
              sexual_minors: false,
              violence: true,
              violence_graphic: false
            },
            category_scores: %Noizu.OpenAI.Moderation.CategoryScore{
              hate: 0.22714105248451233,
              hate_threatening: 0.4132447838783264,
              self_harm: 0.0,
              sexual: 0.01407341007143259,
              sexual_minors: 0.0038522258400917053,
              violence: 0.9223177433013916,
              violence_graphic: 0.036865197122097015
            },
            flagged: true
          }
        ]
      }

      payload = """

      {
        "id": "modr-5MWoLO",
        "model": "text-moderation-001",
        "results": [
          {
            "categories": {
              "hate": false,
              "hate/threatening": true,
              "self-harm": false,
              "sexual": false,
              "sexual/minors": false,
              "violence": true,
              "violence/graphic": false
            },
            "category_scores": {
              "hate": 0.22714105248451233,
              "hate/threatening": 0.4132447838783264,
              "self-harm": 0.005232391878962517,
              "sexual": 0.01407341007143259,
              "sexual/minors": 0.0038522258400917053,
              "violence": 0.9223177433013916,
              "violence/graphic": 0.036865197122097015
            },
            "flagged": true
          }
        ]
      }
      """
      Mimic.expect(Finch, :request, fn(_, _, _) -> {:ok, %Finch.Response{status: 200, body: payload}} end)

      {:ok, result} = Noizu.OpenAI.Api.Moderation.moderate(text)

      assert response == result
    end
  end
end