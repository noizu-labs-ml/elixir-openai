Noizu.OpenAI.Api.Audio
=================================

Noizu.OpenAI.Api.Audio is a part of the Noizu.OpenAI library that provides a simple wrapper around OpenAI's audio API calls for transcription and translation.

# Usage

## 1. Transcribe Audio

Transcribes audio into the input language. The function `transcribe/3` takes the following parameters:

- `audio`: The audio file to transcribe.
- `prompt`: An optional text to guide the model's style or continue a previous audio segment. The prompt should match the audio language.
- `options`: A map of additional options, such as `model`, `response_format`, `temperature`, and `language`.

Example usage:

```elixir
Noizu.OpenAI.Api.Audio.transcribe("audio.mp3", "optional prompt", %{model: "whisper-1"})
```

## 2. Translate Audio

Translates audio into English. The function `translate/3` takes the following parameters:

- `audio`: The audio file to translate.
- `prompt`: An optional text to guide the model's style or continue a previous audio segment. The prompt should be in English.
- `options`: A map of additional options, such as `model`, `response_format`, and `temperature`.

Example usage:

```elixir
Noizu.OpenAI.Api.Audio.translate("german.m4a", "optional prompt", %{model: "whisper-1"})
```

# Models

Currently, only the `whisper-1` model is available for use in the audio transcription and translation API calls.

# Response Formats

The response format can be set to one of the following options: `json`, `text`, `srt`, `verbose_json`, or `vtt`. By default, it is set to `json`.

# Temperature

The sampling temperature can be set between 0 and 1. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic. If set to 0, the model will use log probability to automatically increase the temperature until certain thresholds are hit.

# Mode Details
Please refer to the [OpenAI API documentation](https://beta.openai.com/docs/) for more information about the models and their capabilities.

# Notes from OpenAI

* The Whisper ASR API is designed for Automatic Speech Recognition (ASR) and transcribes spoken language into written text.
* The Whisper ASR model is trained on multilingual and multitask supervised data collected from the web.
* The Whisper model works best with clear, isolated speech and may not perform well on low-quality audio or noisy environments.