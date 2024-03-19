FROM node:20

# Install Zola
ENV ZOLA_VERSION="0.18.0"
ARG TARGETARCH
RUN if [ "$TARGETARCH" = "arm64" ]; then \
      curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && \
      . $HOME/.cargo/env && \
      apt-get update && apt-get install -y git cmake pkg-config libssl-dev && \
      git clone https://github.com/getzola/zola.git && \
      cd zola && \
      git checkout tags/v${ZOLA_VERSION} -b v${ZOLA_VERSION}-branch && \
      cargo build --release && \
      mv target/release/zola /usr/local/bin/ && \
      apt-get clean && \
      rm -rf /var/lib/apt/lists/*; \
    else \
      curl -L "https://github.com/getzola/zola/releases/download/v${ZOLA_VERSION}/zola-v${ZOLA_VERSION}-x86_64-unknown-linux-gnu.tar.gz" -o zola.tar.gz && \
      tar -xzf zola.tar.gz -C /usr/local/bin && \
      rm zola.tar.gz; \
    fi

# Set the working directory in the container
WORKDIR /usr/src/app

# install npm packages
COPY package.json ./
RUN npm install

COPY . .
RUN make css

EXPOSE 1111

CMD ["zola", "-r", "site", "serve", "-i", "0.0.0.0"]