import { pageTitle } from 'ember-page-title';
import { DateTime } from 'luxon';
import { on } from '@ember/modifier';
import Component from '@glimmer/component';
import { service } from '@ember/service';

const today = DateTime.now().toFormat('yyyy-MM-dd');
const lastYear = DateTime.now().minus({ years: 1 }).toFormat('yyyy-MM-dd');

export default class IndexComponent extends Component {
  @service router;

  navigate = (e) => {
    e.preventDefault();

    const formData = new FormData(e.target);
    // TIL that you can just pass a string with a `/` at the start
    this.router.transitionTo(
      `/${formData.get('pkg')}/${formData.get('from')}/${formData.get('to')}`
    );
  };
  <template>
    {{pageTitle "Index"}}

    <form {{on "submit" this.navigate}}>
      <label>Package<input name="pkg" required /></label>
      <label>From<input type="date" name="from" value={{lastYear}} /></label>
      <label>To<input type="date" name="to" value={{today}} /></label>
      <button type="submit">Show Me!</button>
    </form>

    {{outlet}}
  </template>
}
