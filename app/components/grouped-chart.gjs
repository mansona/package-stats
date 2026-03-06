import { Chart } from 'chart.js';
import { options } from './common-chart';
import { DateTime } from 'luxon';

import { modifier } from 'ember-modifier';

const chartModifier = modifier((element, [rawData, grouping]) => {
  const weeklyData = new Map();
  const data = [];

  rawData.forEach((e) => {
    let startOfWeek = DateTime.fromISO(e.day)
      .startOf(grouping)
      .toFormat('yyyy-MM-dd');
    weeklyData.set(
      startOfWeek,
      (weeklyData.get(startOfWeek) ?? 0) + e.downloads
    );
  });

  for (let [key, value] of weeklyData) {
    data.push({ x: key, y: value });
  }

  const chartData = {
    labels: [],
    datasets: [
      {
        data,
        backgroundColor: '#f8dddd',
        borderColor: '#cf1111',
        fill: true,
      },
    ],
  };

  new Chart(element, {
    type: 'line',
    data: chartData,
    options: options(data.length),
  });
});

<template>
  <canvas {{chartModifier @data @grouping}}></canvas>
</template>
