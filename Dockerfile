# My custom Python image, you can use a more generic Debian/Ubuntu based one
FROM python:3.9

# Where we're going to store everything
WORKDIR /workspace

# Requirements for OpenBLAS (CPU: libopenblas-dev) and CLBlast (GPU: libclblast-dev, only from Ubuntu 22.04)
RUN apt-get update \
    && apt-get -yq --no-upgrade install \
        libopenblas-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists /var/cache/apt/*

# Build KoboldCPP (available with LLAMA_OPENBLAS=1 LLAMA_CLBLAST=1)
RUN bash -xc "\
    git clone https://github.com/LostRuins/koboldcpp \
    && pushd koboldcpp && make LLAMA_OPENBLAS=1 && popd \
    && mv /workspace/koboldcpp/* /workspace && rm -rf /workspace/koboldcpp\
	"

# Where we will store the models
RUN mkdir -p /workspace/models \
    && echo "Please put a proper model here!" > /workspace/models/default.bin

# Setup entrypoint
COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
CMD "/docker-entrypoint.sh"
