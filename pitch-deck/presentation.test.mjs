import test from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
const read = name => readFileSync(new URL(name, import.meta.url), 'utf8');
const deck = read('main.typ');
const sources = JSON.parse(read('sources.json'));
test('14 explicitly themed slides', () => {
  assert.equal([...deck.matchAll(/#slide\("(?:dark|light)"/g)].length, 14);
  assert.equal([...deck.matchAll(/#pagebreak\(\)/g)].length, 13);
});
test('all slide citations resolve to primary-source URLs', () => {
  const calls = [...deck.matchAll(/#\(t\.cite\)\(([^)]*)\)/g)];
  assert.ok(calls.length > 0, 'Expected slide citations');
  for (const call of calls) {
    for (const [, id] of call[1].matchAll(/"([A-Z0-9]+)"/g)) {
      assert.ok(sources[id], `Missing ${id}`);
      assert.match(sources[id].url, /^https:\/\//);
    }
  }
});
test('scope stays on the workflow and labels hypothetical output', () => {
  assert.doesNotMatch(deck, /\b(loan|lending|stablecoin|fund-share|underwriting|credit score)\b/i);
  assert.match(deck, /Proposed handoff \/ mock output/);
  assert.match(deck, /not an interviewed customer/);
  assert.match(deck, /Why not keep using Excel/);
});
