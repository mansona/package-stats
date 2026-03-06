import { pageTitle } from 'ember-page-title';

import CumalitiveChart from '../components/cumalative-chart';
import DailyChart from '../components/daily-chart';

function formatDate(date) {
  return date.toFormat('yyyy-MM-dd');
}

<template>
  {{pageTitle "Package"}}
  <h2>Stats for package
    {{@model.pkg}}
    from
    {{formatDate @model.from}}
    to
    {{formatDate @model.to}}</h2>

  <section>
    <h3>Daily Downloads</h3>
    <div class="chart-container">
      <DailyChart @data={{@model.result}} />
    </div>
  </section>

  <section>
    <h3>Cumalative Downloads</h3>
    <div class="chart-container">
      <CumalitiveChart @data={{@model.result}} />
    </div>
  </section>

  {{outlet}}
</template>
