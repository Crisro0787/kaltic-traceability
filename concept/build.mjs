import { NodeCompiler } from '@myriaddreamin/typst-ts-node-compiler';
import { writeFileSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { dirname, join } from 'node:path';

const root = dirname(fileURLToPath(import.meta.url));
const compiler = NodeCompiler.create({
  workspace: root,
  fontArgs: [{ fontPaths: [join(root, 'assets/fonts')] }],
});

try {
  const result = compiler.compile({ mainFilePath: join(root, 'main.typ') });
  result.printDiagnostics();
  if (!result.result) throw new Error('Typst compilation failed; see diagnostics above.');
  const pdf = compiler.pdf(result.result, { creationTimestamp: 0 });
  const output = join(root, 'kaltic-concept.pdf');
  writeFileSync(output, pdf);
  console.log(`Built ${output} (${pdf.length.toLocaleString()} bytes)`);
} catch (error) {
  console.error(error);
  process.exitCode = 1;
}
