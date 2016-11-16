'use strict';

const service = require('feathers-mongoose');
const hooks = require('./hooks');
const Model = require('./views-model');

module.exports = function(){
  const app = this;

  let options = {
    Model,
    lean: true
  };

  // Initialize our service with any options it requires
  app.use('/views', service(options));

  // Get our initialize service to that we can bind hooks
  const viewsService = app.service('/views');

  // Set up our before hooks
  viewsService.before(hooks.before);

  // Set up our after hooks
  viewsService.after(hooks.after);
};
