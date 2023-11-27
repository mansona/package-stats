import Route from '@ember/routing/route';

export default class PackageChartRoute extends Route {
  model({chart}) {
    return {
      ...this.modelFor('package'),
      chart,
    };
  }
}
