###
descriptor.coffee
###
module.exports = do ->
  ###
    factory function for generating a getter function for a spec prop
  ###

  _descValuePrefix = "_"

  descPrefixify = (prop) ->
    unless prop[0..._descValuePrefix.length] == _descValuePrefix
      prop = "#{_descValuePrefix}#{prop}"
    prop

  _defaultGetter = (prop) ->
    -> @["#{prop}"]

  _defaultSetter = (prop) ->
    (val) -> 
      @["#{prop}"] = val
      val

  
  _emptySetter = (prop) ->
    (val) ->
      console.log("#{prop} setter not implmented")
      val

  addDescProp = (obj, prop, get, set) ->
    Object.defineProperty obj, prop, 
      get: get
      set: set
      enumerable: true
      configurable: true
    obj

  ###

    short for - simpler to use, dont have to pass getter or setter
      prop will be set to underscore begining name
  ###
  addDesc = (obj, prop, get, set) ->
    prop = descPrefixify(prop)
    get ?= _defaultGetter(prop)
    set ?= _emptySetter(prop)
    addDescProp obj, prop, get, set

  ###
    converts a existing real propertiy in a object to a descriptored property
      the value of the property will now be hold by the "#{_descValuePrefix}prop"
      and direct getting or setting of the prop will result in calls to getter
      or setter
  ###

  convertPropToDesc = (obj, existingProp, get, set) ->
    prop = descPrefixify(existingProp)
    obj[prop] = obj[existingProp]
    get ?= _defaultGetter(prop)
    set ?= _emptySetter(prop)
    addDescProp obj, existingProp, get, set
    obj

  {addDescProp, addDesc, convertPropToDesc}


