#= require lib/base.js.coffee
#= require lib/vm/page-content-viewmodel.js.coffee

do ->

    PageContentViewModel = require("lib.vm.PageContentViewModel")

    class Home extends PageContentViewModel
        constructor: ->
            super('views/home/home')

            # Hero Section
            @companyHeroImage = ko.observable("")
            @companyHeroHeader = ko.observable("")
            @companyHeroSubHeader = ko.observable("")
            @companyHeroButton = ko.observable("")

        prepDemo: ->
            # Hero Section
            @companyHeroImage("http://i.imgur.com/qB4Oq9Y.png")
            @companyHeroHeader("Empowered To Be Your Healthiest")

    define('vm.Home', Home)
