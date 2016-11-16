'use strict';

const assert = require('assert');
const app = require('../../../src/app');

describe('views service', function() {
  it('registered the views service', () => {
    assert.ok(app.service('views'));
  });
});
