implementation of https://blog.kronis.dev/tutorials/self-hosting-an-ai-llm-chatbot-without-going-broke with little changes to make it run-able in my machine

### usage

download model from here (https://huggingface.co/TehVenom/Metharme-7b-4bit-Q4_1-GGML/tree/main) and save to `models` folder, edit `docker-compose.yml` `volume` value to select the model

### build image

```
docker build -t koboldcpp-container .
```
or just run it with `docker-compose`

### run

```
docker-compose up
```