import {
  Chart,
  Filler,
  LinearScale,
  LineController,
  LineElement,
  PointElement,
  TimeSeriesScale,
  Title,
  Tooltip,
} from 'chart.js';
import 'chartjs-adapter-luxon';
Chart.register(
  Filler,
  LinearScale,
  LineController,
  LineElement,
  PointElement,
  TimeSeriesScale,
  Title,
  Tooltip
);

Chart.defaults.font.family = 'Roboto';
Chart.defaults.font.weight = 'bold';

const delayBetweenPoints = 3;
const previousY = (ctx) =>
  ctx.index === 0
    ? ctx.chart.scales.y.getPixelForValue(100)
    : ctx.chart
        .getDatasetMeta(ctx.datasetIndex)
        .data[ctx.index - 1].getProps(['y'], true).y;
export const animation = {
  x: {
    type: 'number',
    easing: 'linear',
    duration: delayBetweenPoints,
    from: NaN, // the point is initially skipped
    delay(ctx) {
      if (ctx.type !== 'data' || ctx.xStarted) {
        return 0;
      }
      ctx.xStarted = true;
      return ctx.index * delayBetweenPoints;
    },
  },
  y: {
    type: 'number',
    easing: 'linear',
    duration: delayBetweenPoints,
    from: previousY,
    delay(ctx) {
      if (ctx.type !== 'data' || ctx.yStarted) {
        return 0;
      }
      ctx.yStarted = true;
      return ctx.index * delayBetweenPoints;
    },
  },
};

export const options = {
  animation,
  elements: {
    point: {
      radius: 0,
    },
  },
  maintainAspectRatio: false,
  plugins: {
    tooltip: {
      mode: 'nearest',
      intersect: false,
    },
  },
  scales: {
    x: {
      type: 'timeseries',
      ticks: {
        autoSkipPadding: 50,
        major: {
          enabled: true,
        },
        maxRotation: 0,
      },
    },
    y: {
      ticks: {
        autoSkipPadding: 10,
        callback(val) {
          const tho = 1_000;
          const mill = tho * tho;
          const bill = mill * tho;

          if (val > bill) {
            return this.getLabelForValue(val / bill) + 'B';
          } else if (val > mill) {
            return this.getLabelForValue(val / mill) + 'M';
          } else if (val > tho) {
            return this.getLabelForValue(val / tho) + 'k';
          }

          return this.getLabelForValue(val);
        },
      },
    },
  },
};
