###
walk.coffee
###
types = require './types.coffee'

module.exports = do ->
  _mapToValuesArray = (map) ->
    mapValueIter = map.values()
    (mapValueIter.next() for i in [0...map.size])
  getChildren = (obj) ->
    discovered = new Map()
    discovered.set(obj, obj)
    que = [obj]
    while que.length
      o = que.pop()
      switch types.toType o
        when 'array'
          for k in o
            if types.isComplex(k) and not discovered.has(k)
              discovered.set(k, k)
              que.push(k)
        when 'object'
          for own k, v of o
            if types.isComplex(v) and not discovered.has(v)
              discovered.set(v, v)
              que.push(v)
      _mapToValuesArray(discovered)

  {getChildren}