FROM fedora:latest

# install rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

# install mold gcc and zig for cargo lambda
RUN dnf install mold gcc zig -y
ADD ./config.toml ~/.cargo    

# install cargo watch and lambda
RUN cargo install cargo-watch cargo-lambda

