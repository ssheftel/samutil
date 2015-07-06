###
decor is a factory function for generating new decorators
@param {Function} dec The Decorator or Wrapper fn
@param {Function} wrapped (optional) Origonalfunction

Terms:
  decorator = a decorator is a function that takes a function as a argument and returns a new funtion

Example:
  arg_logger_decor = decorator_decor (fn, args...) ->
      console.log "context.joe = #{@.joe}, args = #{args}"
      fn.call(@, args...)

  abc = arg_logger_decor (a, b, c) -> 
      (a*b) + c

  bob1={joe:'moe1'}
  abc.call(bob1, 10, 2, -2)

  bob2 = {
      joe:'moe2',
      df: arg_logger_decor (a, b, c) -> 
          (a*b) + c
  }
  bob2.df(10, 2, -2)

###
module.exports = do ->

  decorator_decor = (dec) ->
    (wrapped) ->
      (args...) ->
        #or dec.bind(@) wrapped, args...
        dec.call(@, wrapped, args...)



  ###
  compose is a high levle function for function composition compose(f, g)(x) is equivlent of f( g(x) )
  @param {Function} outerFn the outer function its signiture should be (fn, args...)
  @param {Function} innerFn the inner function its signiture can be anything

  NoteL the context of the innerFn willbe the same as theouter fn so that compose can work in methids

  Example:
    f = (fn, args...) ->
      console.log 'hi'
      fn(args...)
    g = (a,b,c) ->
      (a*b) + c
    
    fOfG = compose f, g
    fOfG(10,2,-2)# => 18

  ###
  compose = (outerFn, innerFn) ->
    (args...) -> 
      outerFn innerFn.bind(@), args...

  { decorator_decor, compose }