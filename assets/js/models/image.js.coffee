#= require lib/base.js.coffee

do ->

   class Image

      constructor: (data) ->
         assertArgs(arguments, Object)

         # Required
         assertOfType(data.id, String)
         assertOfType(data.link, String)
         assertOfType(data.is_visible, Boolean)

         # Optional
         aassertOfType(data.name, optional(String))

         ###------------------------------------
            Model ID
         ------------------------------------###
         @id = data.id

         ###------------------------------------
            Knockout Observables
         ------------------------------------###
         if data.name?
            @name = ko.observable(data.name)
         else
            @name = ko.observable("Default")

         @link = ko.observable(data.link)
         @isVisible = ko.observable(data.is_visible)


   define("models.Image", Image)
