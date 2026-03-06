import { module, test } from 'qunit';
import { setupRenderingTest } from 'package-stats/tests/helpers';
import { render } from '@ember/test-helpers';
import CumalativeChart from 'package-stats/components/cumalative-chart';

module('Integration | Component | cumalative-chart', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders', async function (assert) {
    // Updating values is achieved using autotracking, just like in app code. For example:
    // class State { @tracked myProperty = 0; }; const state = new State();
    // and update using state.myProperty = 1; await rerender();
    // Handle any actions with function myAction(val) { ... };

    await render(<template><CumalativeChart /></template>);

    assert.dom().hasText('');

    // Template block usage:
    await render(
      <template>
        <CumalativeChart>
          template block text
        </CumalativeChart>
      </template>
    );

    assert.dom().hasText('template block text');
  });
});
