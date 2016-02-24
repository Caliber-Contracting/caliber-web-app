#= require lib/base.js.coffee
#= require vendor/knockout.js

ko.typedObservable = (type, value) ->
   assertType(type)
   observable = ko.observable(value)
   return ->
      assertArgs(arguments, [type, null]) if arguments.length == 1
      observable.apply(@, arguments)
