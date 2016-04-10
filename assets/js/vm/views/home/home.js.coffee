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

            # Process Section
            @processHeader = ko.observable("")
            @processSections = ko.observableArray([])

            @infoBackgroundImage = ko.observable("")
            @infoHeader = ko.observable("")
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
            @studentButtonLabel = ko.observable("")
            @businessButtonLabel = ko.observable("")
            @prepDemo()

            #jQuery is required to run this code
            scaleVideoContainer = ->
                height = $(window).height() + 5
                unitHeight = parseInt(height) + 'px'
                $('.homepage-hero-module').css 'height', unitHeight
                return

            initBannerVideoSize = (element) ->
                $(element).each ->
                    $(this).data 'height', $(this).height()
                    $(this).data 'width', $(this).width()
                    return
                scaleBannerVideoSize element
                return

            scaleBannerVideoSize = (element) ->
                windowWidth = $(window).width()
                windowHeight = $(window).height() + 5
                videoWidth = undefined
                videoHeight = undefined
                console.log windowHeight
                $(element).each ->
                    videoAspectRatio = $(this).data('height') / $(this).data('width')
                    $(this).width windowWidth
                    if windowWidth < 1000
                        videoHeight = windowHeight
                        videoWidth = videoHeight / videoAspectRatio
                        $(this).css
                            'margin-top': 0
                            'margin-left': -(videoWidth - windowWidth) / 2 + 'px'
                        $(this).width(videoWidth).height videoHeight
                        $('.homepage-hero-module .video-container video').addClass 'fadeIn animated'
                        return
                    return

            $(document).ready ->
                scaleVideoContainer()
                initBannerVideoSize '.video-container .poster img'
                initBannerVideoSize '.video-container .filter'
                initBannerVideoSize '.video-container video'
                $(window).on 'resize', ->
                    scaleVideoContainer()
                    scaleBannerVideoSize '.video-container .poster img'
                    scaleBannerVideoSize '.video-container .filter'
                    scaleBannerVideoSize '.video-container video'
                    return
                return

# ---
# generated by js2coffee 2.2.0

        prepDemo: ->
            # Hero Section
            @companyHeroImage("http://i.imgur.com/Ci6vp3K.png")
            @companyHeroHeader("Welcome to CALIBER.")
            @companyHeroSubHeader("Bridging the Gap Between Talent and Industry")

            # Process Section
            @processHeader("Process")
            @processSections([
                {
                image:"http://i.imgur.com/xzQx1Aw.png",
                title:"Source ",
                description:"We source students with industry experience who have experimented with technology outside of their core curriculum and most importantly exude a dedication to leveling up their skill set"
                },
                {
                image:"http://i.imgur.com/L5zGPNx.png",
                title:"Empower",
                description:"Through an accelerated vetting process, we expose developers to professional software engineering in a handful of fields in greater depth than internships or school projects provide"
                },
                {
                image:"http://i.imgur.com/KFl1XQm.png",
                title:"Connect",
                description:"Proven developers are paired with clients in need of work ranging from refactoring existing products to design and development of something new"
                }
            ])

            #Info Section
            @infoBackgroundImage("http://i.imgur.com/C66PAZR.jpg")
            @infoHeader("Our Process")

            @centerImage("http://i.imgur.com/W8yGg8P.png")
            @specDesc("We specialize in iOS, Web Applications, and custom software design.")

            # Partners Section
            @partnersHeader("Partners")
            @logoList([
                {image:"http://i.imgur.com/W4wozQe.png"},
                {image:"http://i.imgur.com/YtukSTj.png"},
                {image:"http://i.imgur.com/ZUlTU6R.png"},
                {image:"http://i.imgur.com/Xu0nHXc.png"}
                ])


            # Learn More
            @learnImage("http://i.imgur.com/nEVLFOz.jpg")
            @busHeader("Clients")
            @studentHeader("Students")
            @businessTitle("Let's Start Your Next Project Today.")
            @businessDesc("Let's Get To Work")
            @studentTitle("")
            @studentDesc("Start Your Career Now")
            @studentButtonLabel("Join Us")
            @businessButtonLabel("Learn More")
        scrollDownYo: ->
            $('html,body').animate { scrollTop: $('#second').offset().top - 75 }, 700


    define('vm.Home', Home)
