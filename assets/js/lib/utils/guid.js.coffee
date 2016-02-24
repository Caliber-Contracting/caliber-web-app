#= require lib/base.js.coffee

do ->
   # NOTE: Not intended for anythign security related. Just unique element identifiers. 
   Guid = ->
      s4 = ->
         Math.random().toString(16).substring 2, 6
      return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4()


   define("lib.utils.Guid", Guid)
   