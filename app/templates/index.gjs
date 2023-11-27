import { pageTitle } from 'ember-page-title';
import { DateTime } from 'luxon';

import Search from 'package-stats/components/search';

const today = DateTime.now().toFormat('yyyy-MM-dd');
const lastYear = DateTime.now().minus({ years: 1 }).toFormat('yyyy-MM-dd');


<template>
  {{pageTitle "Index"}}

  <Search @from={{lastYear}} @to={{today}}/>

  {{outlet}}
</template>

