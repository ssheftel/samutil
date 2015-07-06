
module.exports = do ->

  isString = (v) ->
    typeof v == 'string'
  isNumber = (v) ->
    typeof v is "number" and isFinite(v)
  isBoolean = (v) ->
    typeof v is "boolean"
  isArray = (v) ->
    #v instanceof Array
    toString.apply(v) is "[object Array]"
  isObject = (v) ->
    !!v and Object::toString.call(v) is "[object Object]"
  isDate = (v) ->
    toString.apply(v) is "[object Date]"
  isPrimitive = (v) ->
    isString(v) or isNumber(v) or isBoolean(v)
  isEmpty = (v, allowBlank) ->
    v is null or v is undefined or (isArray(v) and not v.length) or ((if not allowBlank then v is "" else false))
  isComplex = (v) ->
    not isEmpty(v) and not isPrimitive(v)
  isFunction = (v) ->
    toString.apply(v) is "[object Function]"
  
  ###
    general funtion return value will be in 
    "undefined", "number", "boolean", "string", "function", "regexp", "array", "date", "error", object
  ###
  toType = (obj) ->
    ({}).toString.call(obj).match(/\s([a-zA-Z]+)/)[1].toLowerCase()

  {isString, isNumber, isBoolean, isArray, isObject, isDate, isPrimitive, isEmpty, isComplex, isFunction, toType}