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

            # First Section
            @backgroundImage = ko.observable("")
            @infoHeader = ko.observable("")
            @infoSubHeader = ko.observable("")

            @prepDemo()

        prepDemo: ->
            # Hero Section
            @companyHeroImage("http://i.imgur.com/Ci6vp3K.png")
            @companyHeroHeader("Welcome to CALIBER.")
            @companyHeroSubHeader("The Premier Software Contracting Agency of Kansas.")

            # First Section
            @backgroundImage("http://i.imgur.com/C66PAZR.jpg")
            @infoHeader("We are a student-driven contracting agency specilaizing in iOS and Web development.")
            @infoSubHeader("We find the best and the brightest students and pair them with businesses of all sizes needing software development work.")


    define('vm.Home', Home)
