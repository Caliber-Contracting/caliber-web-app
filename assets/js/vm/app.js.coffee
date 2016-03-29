#= require lib/base.js.coffee
#= require lib/vm/page-content-viewmodel.js.coffee
#= require lib/router.js.coffee

do ->

   PageContentViewModel = require("lib.vm.PageContentViewModel")
   router = require("lib.Router.Instance")

   class App extends PageContentViewModel
      constructor: ->
         super()
         @companyHeaderLogo = ko.observable("http://i.imgur.com/n0nC8GT.png")
         @backgroundImage = ko.observable("http://i.imgur.com/Ci6vp3K.png")
         @homeImage = ko.observable("http://i.imgur.com/sURn7P1.png")
         @aboutImage = ko.observable("http://i.imgur.com/n40SwZQ.png")
         @portfolioImage = ko.observable("http://i.imgur.com/76fl4Uk.png")
         @contactImage = ko.observable("http://i.imgur.com/aMoqbrv.png")
         @linkStatus = ko.observableArray([false, false, false, false, false])

         # Subnav
         @subnavLinks = ko.observableArray()
         @showingSubnavBackBtn = ko.observable(false)
         @subnavBackBtnLink = ko.observable("")
         @subnavBackBtnText = ko.observable("")

         @activeUrl = ko.observable()
         @selectedPage = ko.observable()
         $(window).scroll ->
             if (true)
                 if $(this).scrollTop() > 164
                     $(".navbar").addClass("navbar-scrolled")
                 else
                     $(".navbar").removeClass("navbar-scrolled")

      setContent: (viewModel, childKey) ->
         $(window).scrollTop(0)
         assertArgs(arguments, PageContentViewModel, optional(String))
         if childKey?
            @setChild(childKey, viewModel)
            child = @getChild(childKey)
            child.title(@title())
         else
            @setChild("main", viewModel)
            @subnavLinks([])
            @showingSubnavBackBtn(false)
            @subnavBackBtnLink("")
            @subnavBackBtnText("")


      setSubnav: (subnavLinks, options) ->
         assertArgs(arguments, [arrayOf(Object), Function], optional(Object))
         assertOfType(subnavLinks(), arrayOf(Object)) if subnavLinks instanceof Function
         links = ko.unwrap(subnavLinks)
         @subnavLinks(links) unless links.length == 0
         if options?.backBtn
            @showingSubnavBackBtn(true)
            @subnavBackBtnLink(options.backBtn.link)
            @subnavBackBtnText(options.backBtn.text)
         else
            @showingSubnavBackBtn(false)

      navigate: (page) ->
         @selectedPage(page)
         router.navigate("/#{page}")

      selectPage: (page) ->
         index = 0
         for link in @linkStatus()
            if link == true then @linkStatus()[index] = false
            index++
         switch page
            when "home" then @linkStatus()[0] = true
            when "about" then @linkStatus()[1] = true
            when "portfolio" then @linkStatus()[2] = true
            when "contact" then @linkStatus()[3] = true
            when "students" then @linkStatus()[4] = true

   define("vm.App", App)
   define("vm.App.Instance", new App())
