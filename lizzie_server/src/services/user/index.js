'use strict';

const service = require('feathers-mongoose');
const hooks = require('./hooks');
const Model = require('./user-model');

module.exports = function(){
  const app = this;

  let options = {
    Model,
    lean: true
  };

  // Initialize our service with any options it requires
  app.use('/users', service(options));

  // Get our initialize service to that we can bind hooks
  const userService = app.service('/users');

  // Set up our before hooks
  userService.before(hooks.before);

  // Set up our after hooks
  userService.after(hooks.after);
};
