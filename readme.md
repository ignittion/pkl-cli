# pkl-lang

Allows you to run the [pkl-cli](https://pkl-lang.org/) from a docker container

## Usage

```
# Eval a pkl file
docker run -it --rm -v $PWD:/app jesscarlos/pkl-cli:latest eval -o ./.env config.pkl
```


pkl-lang is (c) Apple, inc.
