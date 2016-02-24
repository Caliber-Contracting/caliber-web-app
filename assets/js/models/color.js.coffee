#= require lib/base.js.coffee

do ->

   class Color

      constructor: (data) ->
         assertArgs(arguments, Object)

         # Required
         assertOfType(data.id, String)
         assertOfType(data.name, String)
         assertOfType(data.color, String)
         assertOfType(data.is_visible, Boolean)

         ###------------------------------------
            Model ID
         ------------------------------------###
         @id = data.id

         ###------------------------------------
            Knockout Observables
         ------------------------------------###
         @name = ko.observable(data.name)
         @color = ko.observable(data.color)
         @isVisible = ko.observable(data.is_visible)


   define("models.Color", Color)
