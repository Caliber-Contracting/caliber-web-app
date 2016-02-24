#= require lib/base.js.coffee

do ->

   class Slide

      constructor: (data) ->
         assertArgs(arguments, Object)

         # Required
         assertOfType(data.id, String)
         assertOfType(data.title, String)
         assertOfType(data.description, String)
         assertOfType(data.image, String)
         assertOfType(data.is_visible, Boolean)

         ###------------------------------------
            Model ID
         ------------------------------------###
         @id = data.id

         ###------------------------------------
            Knockout Observables
         ------------------------------------###
         @title = ko.observable(data.title)
         @description = ko.observable(data.description)
         @image = ko.observable(data.image)
         @isVisible = ko.observable(data.is_visible)


   define("models.Slide", Slide)
