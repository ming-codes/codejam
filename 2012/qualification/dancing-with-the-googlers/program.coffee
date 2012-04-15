#!/usr/bin/env coffee

{inspect} = require 'util'

run = (input) ->
  [n, s, p, set...] = input.split(' ')

  n = parseInt(n, 10)
  s = parseInt(s, 10)
  p = parseInt(p, 10)
  set = set.map (num) -> parseInt num, 10

  #console.log 'n: ', n
  #console.log 's: ', s
  #console.log 'p: ', p
  #console.log 'set', set

  set = set.map (num) ->
    ret = []

    for i in [0..10]
      for j in [0..10]
        for k in [0..10]
          if i + j + k is num and Math.max(i, j, k) - Math.min(i, j, k) <= 2
            ret.push([i, j, k].sort())

    # Sort first to get unique sets
    ret = ret.sort (setA, setB) ->
      if setA[0] isnt setB[0] then setA[0] - setB[0]
      else if setA[1] isnt setB[1] then setA[1] - setB[1]
      else setA[2] - setB[2]

    ret = ret.filter (set, index, arr) ->
      if index is 0 then true
      else
        prev = arr[index - 1]

        not (set[0] is prev[0] and set[1] is prev[1] and set[2] is prev[2])

    #console.log 'ret', ret

    ret

  combo = []

  if set.length > 0
    for i in set[0]
      if set.length > 1
        for j in set[1]
          if set.length > 2
            for k in set[2]
              combo.push([i, j, k])
          else
            combo.push([i, j])
      else
        combo.push([i])

  combo = combo.map (com) ->
    combo: com
    surprise: com.filter (tuple) -> Math.max.apply(null, tuple) - Math.min.apply(null, tuple) is 2

  combo = combo.filter (com) ->
    com.surprise.length is s

  combo = combo.map (com) ->
    com.combo.filter (c) ->
      Math.max.apply(null, c) >= p

  combo = combo.map (com) ->
    com.length

  #console.log 'combo', inspect combo, true, 3

  Math.max.apply(null, combo)

  #reduce = (prev, arr) ->
  #  if arr.length then prev + 1
  #  else prev

  ##console.log set
  ##console.log set.reduce reduce, 0
  #set.reduce reduce, 0


process.stdin.on 'data', (chunk) ->
  buf += chunk
process.stdin.on 'end', ->
  arr = buf.trim().split('\n')
  arr.shift()

  arr.map(run).forEach (output, index) ->
    console.log "Case ##{index + 1}: #{output}"

process.stdin.resume()

buf = ''
