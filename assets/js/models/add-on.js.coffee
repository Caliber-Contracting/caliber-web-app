#= require lib/base.js.coffee

do ->

   class AddOn

      constructor: (data) ->
         assertArgs(arguments, Object)

         # Required
         assertOfType(data.id, String)
         assertOfType(data.description, String)
         assertOfType(data.image, String)
         assertOfType(data.is_visible, Boolean)

         # Optional
         assertOfType(data.name, optional(String))

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

         @description = ko.observable(data.description)
         @image = ko.observable(data.image)
         @isVisible = ko.observable(data.is_visible)


   define("models.AddOn", AddOn)
