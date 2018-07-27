# docker-hugo

A minimal Docker image that only contains the `hugo` binary and a `/workspace` directory mounted as a volume.

## Usage

```
docker run \
  --rm \
  -it \
  -v $(pwd):/workspace \
  mschoening/docker-hugo \
  help
```
