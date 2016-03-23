#= require lib/base.js.coffee
#= require lib/vm/page-content-viewmodel.js.coffee
#= require vendor/sc.min.js

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
            @infoSubHeader2 = ko.observable("")
            @centerImage = ko.observable("")
            @specDesc = ko.observable("")

            # Partners Section
            @partnersHeader = ko.observable("")
            @logoList = ko.observableArray([])

            @prepDemo()

        prepDemo: ->
            # Hero Section
            @companyHeroImage("http://i.imgur.com/Ci6vp3K.png")
            @companyHeroHeader("Welcome to CALIBER.")
            @companyHeroSubHeader("The Premier Software Contracting Agency of Kansas.")

            # First Section
            @backgroundImage("http://i.imgur.com/C66PAZR.jpg")
            @infoHeader("Student Driven.")
            @infoSubHeader("We find the best and the brightest students and pair them with businesses of all sizes needing software development work.")
            @infoSubHeader2("Through an accelerated vetting process, we expose students to professional level software development in a handleful of fields at a level internships or school projects could never achieve.")
            @centerImage("http://i.imgur.com/W8yGg8P.png")
            @specDesc("We specialize in iOS, Web Applications, and custom software design.")
            @logoList([
                {image:"http://i.imgur.com/W4wozQe.png"},
                {image:"http://i.imgur.com/YtukSTj.png"},
                {image:"http://i.imgur.com/5MKCUGx.png"},
                {image:"http://i.imgur.com/ApNrT24.png"}
                ])

            # Partners Section
            @partnersHeader("Our Partners")

        scrollDownYo: ->
            $('html,body').animate { scrollTop: $('#second').offset().top }, 'slow'


    define('vm.Home', Home)
