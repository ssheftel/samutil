require 'es6-shim'
types = require './types.coffee'
descriptor = require './descriptor.coffee'
walk = require './walk.coffee'
log = require './log.coffee'
inspect = require './inspect.coffee'

DEVDEBUG = true
root = root ? window

do (root) ->
	root.samutil = {_, types, descriptor, walk, inspect}
	root.s = root.samutil if DEVDEBUG