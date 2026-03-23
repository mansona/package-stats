import { pageTitle } from 'ember-page-title';

import CumalitiveChart from 'package-stats/components/cumalative-chart';
import DailyChart from 'package-stats/components/daily-chart';
import GroupedChart from 'package-stats/components/grouped-chart';
import FreshContent from 'package-stats/components/fresh-content';
import Search from 'package-stats/components/search';
import YearToDateChart from 'package-stats/components/year-to-date-chart';
import { LinkTo } from '@ember/routing';

function formatDate(date) {
  return date.toFormat('yyyy-MM-dd');
}

<template>
  <FreshContent @for={{@model}}>
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

    <section>
      <h3>Daily Downloads</h3>
      <LinkTo @route="package.chart" @model="day">highlight chart</LinkTo>
      <div class="chart-container">
        <DailyChart @data={{@model.result}} />
      </div>
    </section>

    <section>
      <h3>Weekly Downloads</h3>
      <LinkTo @route="package.chart" @model="week">highlight chart</LinkTo>
      <div class="chart-container">
        <GroupedChart @data={{@model.result}} @grouping="week" />
      </div>
    </section>

    <section>
      <h3>Monthly Downloads</h3>
      <LinkTo @route="package.chart" @model="month">highlight chart</LinkTo>
      <div class="chart-container">
        <GroupedChart @data={{@model.result}} @grouping="month" />
      </div>
    </section>

    <section>
      <h3>Yearly Downloads</h3>
      <LinkTo @route="package.chart" @model="year">highlight chart</LinkTo>
      <div class="chart-container">
        <GroupedChart @data={{@model.result}} @grouping="year" />
      </div>
    </section>

    <section>
      <h3>Cumalative Downloads</h3>
      <LinkTo @route="package.chart" @model="cumalative">highlight chart</LinkTo>
      <div class="chart-container">
        <CumalitiveChart @data={{@model.result}} />
      </div>
    </section>

    <section>
      <h3>Year to date Downloads</h3>
      <LinkTo @route="package.chart" @model="year-to-date">highlight chart</LinkTo>
      <div class="chart-container">
        <YearToDateChart @data={{@model.result}} />
      </div>
    </section>

  </FreshContent>
</template>
