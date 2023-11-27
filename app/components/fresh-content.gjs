import { array } from '@ember/helper';

<template>
  {{#each (array @for)}}
    {{yield}}
  {{/each}}
</template>
