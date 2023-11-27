import { module, test } from 'qunit';
import { setupTest } from 'package-stats/tests/helpers';

module('Unit | Route | package/chart', function (hooks) {
  setupTest(hooks);

  test('it exists', function (assert) {
    let route = this.owner.lookup('route:package/chart');
    assert.ok(route);
  });
});
