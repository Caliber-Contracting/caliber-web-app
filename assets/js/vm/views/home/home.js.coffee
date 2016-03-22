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

            # Second Picture Panel
            @infoHeader = ko.observable("")
            @infoSubHeader = ko.observable("")
            

            # First Section
            @backgroundImage = ko.observable("")

            @prepDemo()

        prepDemo: ->
            # Hero Section
            @companyHeroImage("http://i.imgur.com/Ci6vp3K.png")
            @companyHeroHeader("Welcome to CALIBER.")
            @companyHeroSubHeader("The Premier Software Contracting Agency of Kansas.")
            @backgroundImage("http://i.imgur.com/C66PAZR.jpg")



    define('vm.Home', Home)
