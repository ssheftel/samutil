###
###
types = require './types.coffee'

module.exports = do ->

  whatsMyName = null
  getSelf = null

  ###

  ###
  getCurrentFn = () ->
    getSelf.caller
  ###

  ###
  getCurrentFnName = () ->
    getCurrentFnName.caller.displayName
  ###


  ###
  namify = (obj) ->
    for own k,v of obj
      if types.isFunction v
        if not v.displayName
          v.displayName = k
    return obj


  {getCurrentFn, getCurrentFnName, namify}