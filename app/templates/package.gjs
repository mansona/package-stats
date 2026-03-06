import { pageTitle } from 'ember-page-title';

import CumalitiveChart from '../components/cumalative-chart';

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
  <h3>Cumalative Downloads</h3>
  <div class="chart-container">
    <CumalitiveChart @data={{@model.result}} />
  </div>
  {{outlet}}
</template>
