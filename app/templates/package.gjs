import { pageTitle } from 'ember-page-title';

import CumalitiveChart from '../components/cumalative-chart';
import DailyChart from '../components/daily-chart';
import GroupedChart from '../components/grouped-chart';

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

  <Search @pkg={{@model.pkg}} @from={{formatDate @model.from}} @to={{formatDate @model.to}}/>

  <section>
    <h3>Daily Downloads</h3>
    <div class="chart-container">
      <DailyChart @data={{@model.result}} />
    </div>
  </section>

  <section>
    <h3>Weekly Downloads</h3>
    <div class="chart-container">
      <GroupedChart @data={{@model.result}} @grouping="week" />
    </div>
  </section>

  <section>
    <h3>Monthly Downloads</h3>
    <div class="chart-container">
      <GroupedChart @data={{@model.result}} @grouping="month" />
    </div>
  </section>

  <section>
    <h3>Yearly Downloads</h3>
    <div class="chart-container">
      <GroupedChart @data={{@model.result}} @grouping="year" />
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
