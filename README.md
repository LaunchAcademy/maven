# Maven

System for scanning student QR codes and POSTing them to a service.


## Run

```
ruby scanner.rb
ruby server.rb
bundle exec sidekiq -c 5 -v -r ./app/workers/scan_sync_worker.rb
```
