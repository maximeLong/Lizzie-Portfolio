'use strict';

const globalHooks = require('../../../hooks');
const hooks = require('feathers-hooks');
const auth = require('feathers-authentication').hooks;


const myHook = options => { // always wrap in a function so you can pass options and for consistency.
  return hook => {
    console.log('hi this hook ran')
    return Promise.resolve(hook); // A good convention is to always return a promise.
  };
};


exports.before = {
  all: [],
  find: [],
  get: [],
  create: [
    // TODO: This doesn't actually allow admin to create, for some reason -- this is just a lock by effect of error
    auth.verifyToken(),
    auth.populateUser(),
    auth.restrictToAuthenticated(),
    auth.hasRoleOrRestrict({
      roles: ['admin'],
      fieldName: 'role',
      restrict: { approved: true }
    })
  ],
  update: [
    auth.verifyToken(),
    auth.populateUser(),
    auth.restrictToAuthenticated()
  ],
  patch: [
    auth.verifyToken(),
    auth.populateUser(),
    auth.restrictToAuthenticated()
  ],
  remove: [
    auth.verifyToken(),
    auth.populateUser(),
    auth.restrictToAuthenticated()
  ]
};

exports.after = {
  all: [],
  find: [],
  get: [],
  create: [],
  update: [],
  patch: [],
  remove: []
};
