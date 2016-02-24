#= require lib/base.js.coffee
#= require lib/vm/viewmodel.js.coffee

do ->
   ViewModel = require("lib.vm.ViewModel")

   class ControlViewModel extends ViewModel
      constructor: (template, order) ->
         assertArgs(arguments, String, Number)
         super(template)
         @order = ko.observable(order)
         @isVisible = ko.observable(true)


   define('lib.vm.ControlViewModel', ControlViewModel)
