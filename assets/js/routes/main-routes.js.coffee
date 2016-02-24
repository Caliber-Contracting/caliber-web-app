#= require lib/base.js.coffee
#= require lib/router.js.coffee
#= require vm/app.js.coffee
#= require vm/views/home/home.js.coffee

do ->
   MainRoutes = ->

      app    = require("vm.App.Instance")
      App    = require("vm.App")
      router = require("lib.Router.Instance")

      Home = require("vm.Home")


      # Add the base route.
      router.registerRoute "/home", ->
         app.activeUrl("/home")
         router.navigate "/home"
         home = new Home()
         app.setContent(home)

        #  Leaving an example
    #   router.registerRoute "/why-sunlighten/vision", ->
    #      app.selectedPage("why-sunlighten")
    #      app.activeUrl("/why-sunlighten/vision")
    #      app.setContent(new Vision())
    #      app.setSubnav(MainRoutes.Subnav.WHY_SUNLIGHTEN)



   # MainRoutes.Subnav = {
   #    WHY_SUNLIGHTEN: [
   #       {
   #          name: "vision"
   #          link: "/why-sunlighten/vision"
   #       },{
   #          name: "commitment"
   #          link: "/why-sunlighten/commitment"
   #       },{
   #          name: "innovation"
   #          link: "/why-sunlighten/innovation/solocarbon"
   #       },{
   #          name: "quality"
   #          link: "/why-sunlighten/quality"
   #       },{
   #          name: "experience"
   #          link: "/why-sunlighten/experience"
   #       }
   #    ]


   define('routes.MainRoutes', MainRoutes)
