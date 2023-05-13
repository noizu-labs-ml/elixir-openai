defmodule Noizu.OpenAI.Api.ImageTest do
  use ExUnit.Case
  @moduletag :image

  describe "create/2" do
    test "successful image creation" do
      prompt = "A beautiful sunset over the beach with palm trees"
      response = %Noizu.OpenAI.Images{
        created: ~U[1973-11-29 21:33:09Z],
        images: [
          %Noizu.OpenAI.Images.Image{
            url: "https://images.openai.com/image-url"
          }
        ]
      }
      Mimic.expect(Finch, :request, fn(_, _, _) -> {:ok, %Finch.Response{status: 200, body: "{\"created\": 123456789, \"data\": [{\"url\": \"https://images.openai.com/image-url\"}]}"}} end)

      {:ok, result} = Noizu.OpenAI.Api.Image.create(prompt)

      assert response == result
    end
  end

  describe "edit/3" do
    test "successful image edit" do
      image_url = "https://example.com/your_image.jpg"
      prompt = "Add a spaceship flying in the sky."
      response = %Noizu.OpenAI.Images{
        created: ~U[1973-11-29 21:33:09Z],
        images: [
          %Noizu.OpenAI.Images.Image{
            url: "https://images.openai.com/edited-image-url"
          }
        ]
      }
      Mimic.expect(Finch, :request, fn(_, _, _) -> {:ok, %Finch.Response{status: 200, body: "{\"created\": 123456789, \"data\": [{\"url\": \"https://images.openai.com/edited-image-url\"}]}"}} end)

      {:ok, result} = Noizu.OpenAI.Api.Image.edit(image_url, prompt)

      assert response == result
    end
  end

  describe "variation/3" do
    test "successful image variation" do
      image_url = "https://example.com/your_image.jpg"
      prompt = "A different version of the image with more clouds in the sky."
      response = %Noizu.OpenAI.Images{
        created: ~U[1973-11-29 21:33:09Z],
        images: [
          %Noizu.OpenAI.Images.Image{
            url: "https://images.openai.com/variation-image-url"
          }
        ]
      }
      Mimic.expect(Finch, :request, fn(_, _, _) -> {:ok, %Finch.Response{status: 200, body: "{\"created\": 123456789, \"data\": [{\"url\": \"https://images.openai.com/variation-image-url\"}]}"}} end)

      {:ok, result} = Noizu.OpenAI.Api.Image.variation(image_url, prompt)

      assert response == result
    end
  end
end