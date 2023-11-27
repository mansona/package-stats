import { pageTitle } from 'ember-page-title';

// import CumalitiveChart from 'package-stats/components/cumalative-chart';
// import DailyChart from 'package-stats/components/daily-chart';
import GroupedChart from 'package-stats/components/grouped-chart';

function eq(a, b) {
  return a === b;
}

<template>
  {{pageTitle "Chart"}}

  {{#if (eq @model.chart "year")}}

    <section>
      <h3>Yearly Downloads</h3>
      <div class="chart-container">
        <GroupedChart @data={{@model.result}} @grouping="year" />
      </div>
    </section>
  {{/if}}
  {{outlet}}
</template>
