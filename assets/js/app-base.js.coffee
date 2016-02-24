#= require lib/base.js.coffee

#= require_tree vendor
#= require_tree templates
#= require_tree bindings

#= require lib/router.js.coffee
#= require routes/main-routes.js.coffee

#= require vm/app.js.coffee
#= require app-layout.jst.jade

#= require testing.js.coffee.ejs

$(document).ready ->

   # Create the layout DOM.
   $("body").html(JST["app-layout"]())

   #panelManager = require("lib.managers.PanelManager.Instance")
   #panelManager.initialize()

   # Bind the starting app view model.
   app = require("vm.App.Instance")
   ko.applyBindings(app)

   # This must be last because everything needs to be initialized before listen is called.
   require("routes.MainRoutes")()
   router = require("lib.Router.Instance")
   router.listen()
