const feathers = require('feathers/client')
const socketio = require('feathers-socketio/client');
const hooks = require('feathers-hooks');
const io = require('socket.io-client');

// authentication
const authentication = require('feathers-authentication/client');

// turns services into rxjs event streams
const reactive = require('feathers-reactive');
const RxJS = require('rxjs');

//TODO: this setup doesn't work in production
let serverAddress = new URL(window.location.origin)
serverAddress.port = '3030' //why is this defined here?
const socket = io.connect(serverAddress.href)

console.log( serverAddress, socket);

const _server = feathers()
  .configure(hooks())
  .configure(socketio(socket))
  .configure(authentication({ storage: window.localStorage }))
  .configure(reactive(RxJS, {listStrategy: 'smart', idField: '_id' }));
  // have to provide options to reactive-feathers or else PATCH and UPDATE doesn't work as expected

export const server = _server
export const views = server.service('views')
export const user = server.service('users')
export const viewStream = views.find()

export default _server
