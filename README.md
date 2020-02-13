# Files that are not Java-related

* `Dockerfile`
* `docker-compose.yml`
* `data` directory to store userdata for your local development, like image uploads
* `.env-local` for database credentials and other environment variables

The `command` specified in `docker-compose.yml` -> `web` is not final and should be changed to a dynamic loading approach. 
