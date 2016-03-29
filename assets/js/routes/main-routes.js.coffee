#= require lib/base.js.coffee
#= require lib/router.js.coffee
#= require vm/app.js.coffee
#= require vm/views/home/home.js.coffee
#= require vm/views/about/about.js.coffee
#= require vm/views/portfolio/portfolio.js.coffee
#= require vm/views/contact/businesses.js.coffee
#= require vm/views/contact/students.js.coffee

do ->
   MainRoutes = ->

      app    = require("vm.App.Instance")
      App    = require("vm.App")
      router = require("lib.Router.Instance")

      Home = require("vm.Home")
      About = require("vm.About")
      Portfolio = require("vm.Portfolio")
      Students = require("vm.Students")
      Businesses = require("vm.Businesses")


      # Add the base route.
      router.registerRoute "/home", ->
         app.selectedPage("home")
         app.activeUrl("/home")
         router.navigate "/home"
         home = new Home()
         app.setContent(home)

      router.registerRoute "/about", ->
          app.selectedPage("about")
          app.activeUrl("/about")
          router.navigate "/about"
          about = new About()
          app.setContent(about)

      router.registerRoute "/portfolio", ->
          app.selectedPage("portfolio")
          app.activeUrl("/portfolio")
          router.navigate "/portfolio"
          portfolio = new Portfolio()
          app.setContent(portfolio)

      router.registerRoute "/contact", ->
          router.navigate "/contact/businesses"

      router.registerRoute "/contact/businesses", ->
          app.selectedPage("contact")
          app.activeUrl("/contact/businesses")
          app.setContent(new Businesses())
          app.setSubnav(MainRoutes.Subnav.CONTACT)

      router.registerRoute "/contact/students", ->
          app.selectedPage("contact")
          app.activeUrl("/contact/students")
          app.setContent(new Students())
          app.setSubnav(MainRoutes.Subnav.CONTACT)

        #  Leaving an example
    #   router.registerRoute "/why-sunlighten/vision", ->
    #      app.selectedPage("why-sunlighten")
    #      app.activeUrl("/why-sunlighten/vision")
    #      app.setContent(new Vision())
    #      app.setSubnav(MainRoutes.Subnav.WHY_SUNLIGHTEN)



   MainRoutes.Subnav = {
      CONTACT: [
         {
            name: "businesses"
            link: "/contact/businesses"
         },{
            name: "students"
            link: "/contact/students"
         }
      ]
   }


   define('routes.MainRoutes', MainRoutes)
