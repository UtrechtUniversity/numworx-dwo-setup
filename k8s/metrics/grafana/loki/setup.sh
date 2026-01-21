docker run --name loki -d -v $(pwd):/mnt/config -p 3100:3100 grafana/loki:3.6.0 -config.file=/mnt/config/loki-config.yaml
docker run -p 127.0.0.1:24224:24224 fluent/fluent-bit /fluent-bit/bin/fluent-bit -i forward -o stdout -p format=json_lines -f 1
docker run --log-driver=fluentd -t ubuntu echo "Testing a log message"

docker run -p 127.0.0.1:24224:24224 --link loki:loki fluent/fluent-bit /fluent-bit/bin/fluent-bit -i forward -o loki -p host=loki -p port=3100 -f 1
docker run -d -p 3000:3000 --name=grafana --link loki:loki grafana/grafana-enterprise
