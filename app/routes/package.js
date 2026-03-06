import Route from '@ember/routing/route';
import { DateTime } from 'luxon';

export default class PackageRoute extends Route {
  async model({ pkg, from: fromISO, to: toISO }) {
    const result = [];

    let from = DateTime.fromISO(fromISO);
    let to = DateTime.fromISO(toISO);

    async function getData(from, to) {
      const res = await fetch(
        `https://api.npmjs.org/downloads/range/${from.toFormat('yyyy-MM-dd')}:${to.toFormat('yyyy-MM-dd')}/${pkg}`
      );
      const json = await res.json();
      if (json.downloads) {
        json.downloads.forEach((e) => {
          result.push(e);
        });
      }
    }

    if (to.diff(from, 'months').months > 18) {
      let cursor = from;

      while (cursor.plus({ months: 18 }) < to) {
        let next = cursor.plus({ months: 18 });
        await getData(cursor, next);
        cursor = next;
      }

      // we crossed the boundary so we need to go from the cursor to to
      await getData(cursor, to);
    } else {
      await getData(from, to);
    }
    return { pkg, from, to, result };
  }
}
