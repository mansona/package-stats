import { Chart } from 'chart.js';
import { options } from './common-chart';

import { modifier } from 'ember-modifier';

const chartModifier = modifier((element, [rawData]) => {
  const data = [];
  rawData.forEach((e) => {
    data.push({ x: e.day, y: e.downloads });
  });

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
  <canvas {{chartModifier @data}}></canvas>
</template>
