
kafka-console-consumer --bootstrap-server 127.0.0.1:9092 --topic greetings --from-beginning


curl -X GET http://localhost:9000/api/hello/Alice
curl -H "Content-Type: application/json" -X POST -d '{"message":"Hi"}' http://localhost:9000/api/hello/Alice


curl -X GET http://localhost:9000/api/tweet/Alice
curl -H "Content-Type: application/json" -X POST -d '{"tweet":"Hi"}' http://localhost:9000/api/tweet/Alice
