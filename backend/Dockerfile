FROM rust:buster as builder

WORKDIR /build
COPY . .
RUN cargo build --release

FROM debian:bookworm-slim

WORKDIR /app

RUN apt-get update && apt install -y libpq-dev openssl ca-certificates
COPY --from=builder /build/target/release/api_run .


EXPOSE 8080

COPY ./raw_input/ /app/raw_input

CMD ["./api_run"]
