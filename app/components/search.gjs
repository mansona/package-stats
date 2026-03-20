import Component from '@glimmer/component';

import { on } from '@ember/modifier';
import { service } from '@ember/service';

export default class Search extends Component {
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
    <form {{on "submit" this.navigate}}>
      <label>Package<input name="pkg" required value={{@pkg}} /></label>
      <label>From<input type="date" name="from" value={{@from}} /></label>
      <label>To<input type="date" name="to" value={{@to}} /></label>
      <button type="submit">Show Me!</button>
    </form>
  </template>
}
