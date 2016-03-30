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

            # Learn More Section
            @learnImage = ko.observable("http://i.imgur.com/nEVLFOz.jpg")
            @busHeader = ko.observable("")
            @studentHeader = ko.observable("")
            @businessTitle = ko.observable("")
            @businessDesc = ko.observable("")
            @studentTitle = ko.observable("")
            @studentDesc = ko.observable("")

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
                {image:"http://i.imgur.com/ZUlTU6R.png"},
                {image:"http://i.imgur.com/Xu0nHXc.png"}
                ])

            # Partners Section
            @partnersHeader("Our Partners")

            # Learn More
            @learnImage("http://i.imgur.com/nEVLFOz.jpg")
            @busHeader("Are you a Business?")
            @studentHeader("Or a Student?")
            @businessTitle("Let's Start Your Next Project Today.")
            @businessDesc("Just start by telling us a little about your project, budget, and any other details and we will get started! Our next steps usually include a follow up email, phone or video conference, then a project proposal. At the same time, we will be assembling your personalized development team. Follow the link below to begin.")
            @studentTitle("Start Your Career Now, Not When You Graduate.")
            @studentDesc("CALIBER was started by students, for students. If you are a driven, upper-level Computer Science, or related-major student we are looking for you. Our unique vetting process allows to to take on real-world paid projects, work with expierenced Project Managers, and build your resume faster than any internship could allow. Follow the link below to join CALIBER, and super-charge your future.")

        scrollDownYo: ->
            $('html,body').animate { scrollTop: $('#second').offset().top - 75 }, 700


    define('vm.Home', Home)
