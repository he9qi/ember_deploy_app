# ember_deploy_app

Ember Sinatra deploy hosting for https://github.com/ember-cli/ember-cli-deploy

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/he9qi/ember_deploy_app)

The image responds to these environment variables:

### `APP_NAME`

The name of the application as deployed in Redis.

### `REDIS_HOST`

The hostname of the Redis server where ember-cli applications are deployed.
This default to `redis` and so it is also possible to use Docker container
links to connect the ember-lightning container to a running Redis container.

### `REDIS_PORT`

The port that Redis is listening on. Defaults to 6379. This only needs to be
set if Redis is listening on a non-default port.

### `REDIS_SECRET`

The shared secret to use for authenticating to Redis. It is blank by default,
which disables authentication.
