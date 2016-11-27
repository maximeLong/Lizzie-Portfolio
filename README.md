# Lizzie's portfolio
> vue cli, feathers cli --> mongoose models, socket.io connection into rxjs streams

## Build Setup

``` bash
# install dependencies
cd app && npm install
cd server && npm install


# serve with hot reload at localhost:8080
cd app && npm start
cd server && npm start


# build for production
npm run build (saves minified code to server path)
git push origin master (master branch is up to date)

heroku login
git subtree push --prefix <server folder> heroku master (makes git subtree repo of server path)

```

Vue loader docs: [guide](http://vuejs-templates.github.io/webpack/)

Feathers docs: [docs]https://docs.feathersjs.com/
