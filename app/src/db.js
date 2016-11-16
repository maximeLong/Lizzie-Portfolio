const feathers = require('feathers/client')
const socketio = require('feathers-socketio/client');
const hooks = require('feathers-hooks');
const io = require('socket.io-client');

//for lizzie signin
const authentication = require('feathers-authentication/client');

//turns services into rxjs event streams
const reactive = require('feathers-reactive');
const RxJS = require('rxjs');


const socket = io('http://localhost:3030/');
const _server = feathers()
  .configure(hooks())
  .configure(socketio(socket))
  .configure(authentication({ storage: window.localStorage }))
  .configure(reactive(RxJS));

//property exports, imported using:   { ** } from '**'
export const server = _server
export const views = server.service('views')
export const viewStream = views.find()

//default export, imported using:    ** from '**'
export default _server
