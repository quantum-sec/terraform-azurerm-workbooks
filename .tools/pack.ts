#!/usr/bin/env node

import * as path from 'path';
import { promises as fs } from 'fs';
import * as tar from 'tar';

const CONTENT_BASE: string = path.normalize(`${__dirname}/../../content/`);
const SOURCE_DIRECTORIES: string[] = ['workbooks'];
const CONTAINER: string = path.relative('.', path.normalize(`${__dirname}/../../dist/assets/content.tar.gz`));

const main = async (): Promise<void> => {
  console.log({ ['file_list']: SOURCE_DIRECTORIES });
  try {
    await fs.mkdir(path.dirname(CONTAINER), { recursive: true });
    await tar.c({ gzip: true, file: CONTAINER, cwd: CONTENT_BASE }, SOURCE_DIRECTORIES);
  }
  catch (err: unknown) {
    console.error(err);
    process.exit(1);
  }
};

main().then(() =>
  console.log({ artifacts: [CONTAINER] })
).catch((err: unknown) => {
  if (err) {
    throw err;
  }
});
