FROM golang:1.19 AS builder
WORKDIR /app
COPY src/ /app
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM alpine:3.13.5
COPY --from=builder /app/main .
ENTRYPOINT ["./main"]