 WORKDIR /emx-im
COPY . /emx-im
RUN go env -w GOPROXY=https://goproxy.cn,direct
RUN CGO_ENABLED=0 go build -v -o main .
 
FROM alpine AS api
RUN mkdir /app
COPY --from=build /emx-im/main /app
WORKDIR /app
ENTRYPOINT ["./main", "-v" ,"1.3"]