#!/usr/bin/env coffee

map =
  'a': 'y'
  'b': 'h'
  'c': 'e'
  'd': 's'
  'e': 'o'
  'f': 'c'
  'g': 'v'
  'h': 'x'
  'i': 'd'
  'j': 'u'
  'k': 'i'
  'l': 'g'
  'm': 'l'
  'n': 'b'
  'o': 'k'
  'p': 'r'
  'q': 'z'
  'r': 't'
  's': 'n'
  't': 'w'
  'u': 'j'
  'v': 'p'
  'w': 'f'
  'x': 'm'
  'y': 'a'
  'z': 'q'
  ' ': ' '


run = (input, index) ->
  input.split('').map((key) -> map[key]).join('').trim()

process.stdin.on 'data', (chunk) ->
  buf += chunk
process.stdin.on 'end', ->
  arr = buf.trim().split('\n')
  arr.shift()

  arr.map(run).forEach (output, index) ->
    console.log "Case ##{index + 1}: #{output}"

process.stdin.resume()

buf = ''
