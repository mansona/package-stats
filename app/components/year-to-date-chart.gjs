import { Chart } from 'chart.js';
import { options as optionsGenerator } from './common-chart';
import { DateTime } from 'luxon';

import { modifier } from 'ember-modifier';

const availableColours = [
  '#005595',
  '#0074B4',
  '#0085CA',
  '#0098DD',
  '#00A6EC',
  '#02b3ee',
  '#44c0f0',
  '#7cd2f4',
  '#b0e4f8',
  '#E0F5FC',
];

const chartModifier = modifier((element, [rawData]) => {
  const weeklyData = new Map();
  const yearlyData = {};

  rawData.forEach((e) => {
    let startOfWeek = DateTime.fromISO(e.day)
      .startOf('week')
      .toFormat('yyyy-MM-dd');
    weeklyData.set(
      startOfWeek,
      (weeklyData.get(startOfWeek) ?? 0) + e.downloads
    );
  });

  for (let [weekDate, value] of weeklyData) {
    let date = DateTime.fromISO(weekDate);

    if (!yearlyData[date.year]) {
      yearlyData[date.year] = [];
    }

    yearlyData[date.year].push({ x: date.ordinal, y: value });
  }

  const chartData = {
    labels: [],
    datasets: [],
  };

  const iter = availableColours[Symbol.iterator]();

  for (let [year, value] of Object.entries(yearlyData).reverse()) {
    chartData.datasets.push({
      label: year,
      data: value,
      borderColor: iter.next().value,
    });
  }

  const options = optionsGenerator(52);

  options.scales.x = {
    type: 'linear',
    max: 365,
  };

  new Chart(element, {
    type: 'line',
    data: chartData,
    options,
  });
});

<template>
  <canvas {{chartModifier @data}}></canvas>
</template>
