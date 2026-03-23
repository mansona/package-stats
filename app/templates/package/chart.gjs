import { pageTitle } from 'ember-page-title';

import CumalitiveChart from 'package-stats/components/cumalative-chart';
import DailyChart from 'package-stats/components/daily-chart';
import GroupedChart from 'package-stats/components/grouped-chart';
import Search from 'package-stats/components/search';

function eq(a, b) {
  return a === b;
}

function formatDate(date) {
  return date.toFormat('yyyy-MM-dd');
}

<template>
  {{pageTitle "Chart"}}

  {{pageTitle "Package"}}
  <h2>Stats for package
    {{@model.pkg}}
    from
    {{formatDate @model.from}}
    to
    {{formatDate @model.to}}</h2>

  <Search
    @pkg={{@model.pkg}}
    @from={{formatDate @model.from}}
    @to={{formatDate @model.to}}
  />

  <section class="focus-chart">
    {{#if (eq @model.chart "year")}}
      <h3>Yearly Downloads</h3>
      <div class="chart-container">
        <GroupedChart @data={{@model.result}} @grouping="year" />
      </div>
    {{else if (eq @model.chart "day")}}

      <h3>Daily Downloads</h3>

      <div class="chart-container">
        <DailyChart @data={{@model.result}} />
      </div>
    {{else if (eq @model.chart "week")}}

      <h3>Weekly Downloads</h3>

      <div class="chart-container">
        <GroupedChart @data={{@model.result}} @grouping="week" />
      </div>

    {{else if (eq @model.chart "month")}}

      <h3>Montly Downloads</h3>

      <div class="chart-container">
        <GroupedChart @data={{@model.result}} @grouping="month" />
      </div>
    {{else if (eq @model.chart "cumalative")}}

      <h3>Cumalative Downloads</h3>
      <div class="chart-container">
        <CumalitiveChart @data={{@model.result}} />
      </div>

    {{/if}}
  </section>
  {{outlet}}
</template>
