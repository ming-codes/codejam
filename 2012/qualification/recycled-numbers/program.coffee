#!/usr/bin/env coffee

# Steps:
# 1. Generate uniq number between a and b
# 2. Rotate the numbers
# 3. Flatten the rotated numbers
# 
# filter for valid numbers (a <= x <= b)
#
# 3. Uniq the rotated numbers
# 4. Generate pairs

# Step 1: Generate unique int between a and b
generate = (a, b) -> num for num in [a..b]

# Step 2: Rotate the numbers
rotate = (input) ->
  input = input.map (num) ->
    arr = num.toString(10).split('')
    len = arr.length

    while len--
      arr.unshift(arr.pop())
      parseInt(arr.join(''), 10)

# Step 3: Flatten
flatten = (input) ->
  ret = []

  recur = (arr) ->
    for ele in arr
      if typeof ele is 'number' then ret.push(ele)
      else recur(ele)

  recur(input)

  ret

# Step 4: Unique
uniq = (arr, cache = {}) ->
  cache[num.toString(10)] = true for num in arr

  for num of cache
    parseInt(num, 10)

# Step 5: Filter
filter = (arr, a, b) ->
  arr.filter (num) ->
    a <= num <= b

# Step 6: Pair up!
pair = (arr) ->
  arr.map (n, index) ->
    for mdex in [index..arr.length - 1]
      if n isnt arr[mdex] then {n: n, m: arr[mdex]}
      else {}

# Step 7: Concat all pairs together
concat = (arr) ->
  reducer = (prev, pairs) ->
    prev.concat pairs.filter (pair) ->
      pair.m and pair.n

  arr.reduce reducer, []
    

###
pairs = (arr) ->
  ret = []

  for num1, i in arr
    for num2, j in arr
      ret.push([num1, num2].sort()) if i isnt j

  console.log 'gen\'d pairs', ret

  ret

examine = (num, min, max) ->
  valid = pairs(rotate(num)).filter ([n, m]) ->
    min <= n < m <= max

uniq = (pairs) ->
  unless pairs.length then []
  else
    pairs = pairs.sort (a, b) ->
      a[0] - b[0]
    pairs = pairs.filter (pair, index, arr) ->
      if index >= arr.length - 1 then true
      else pair[0] isnt arr[index + 1][0] and pair[1] isnt arr[index + 1][1]

    #console.log pairs
###

run = (input) ->
  [a, b] = input.split ' '

  result = generate(a, b)
  result = rotate(result)
  result = flatten(result)
  result = uniq(result)
  result = filter(result, a, b)
  result = pair(result)
  result = concat(result)

  result = result.filter (pair) ->
    a <= pair.n < pair.m <= b

  console.log result, result.length
  # Steps:
  # 1. Generate uniq number between a and b
  # 2. Rotate the numbers
  # 3. Uniq the rotated numbers
  # 4. Generate pairs
  ###
  reducer = (prev, arr) ->
    for num in arr
      prev[num.toString(10)] = true

    prev

  nums = (rotate(num) for num in [a..b]).reduce reducer, {}

  result = for num of nums
    if a <= parseInt(num) <= b then parseInt(num)
    else undefined

  result = result.filter (num) -> num

  console.log result
  ###

  ###
  reducer = (prev, pairs) ->
    prev.concat pairs

  result = (examine num, a, b for num in [a..b]).reduce reducer, []
  ###

  #console.log uniq(result).length



















process.stdin.on 'data', (chunk) ->
  buf += chunk
process.stdin.on 'end', ->
  arr = buf.trim().split('\n')
  arr.shift()

  arr.map(run).forEach (output, index) ->
    console.log "Case ##{index + 1}: #{output}"

process.stdin.resume()

buf = ''
