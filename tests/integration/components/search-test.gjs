import { module, test } from 'qunit';
import { setupRenderingTest } from 'package-stats/tests/helpers';
import { render } from '@ember/test-helpers';
import Search from 'package-stats/components/search';

module('Integration | Component | search', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    // Updating values is achieved using autotracking, just like in app code. For example:
    // class State { @tracked myProperty = 0; }; const state = new State();
    // and update using state.myProperty = 1; await rerender();
    // Handle any actions with function myAction(val) { ... };

    await render(<template><Search /></template>);

    assert.dom().hasText('');

    // Template block usage:
    await render(<template>
      <Search>
        template block text
      </Search>
    </template>);

    assert.dom().hasText('template block text');
  });
});
