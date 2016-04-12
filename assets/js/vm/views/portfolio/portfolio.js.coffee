#= require lib/base.js.coffee
#= require lib/vm/page-content-viewmodel.js.coffee
#= require vendor/sc.min.js

do ->

    PageContentViewModel = require("lib.vm.PageContentViewModel")

    class Portfolio extends PageContentViewModel
        constructor: ->
            super('views/portfolio/portfolio')

            # Work Section
            @workHeader = ko.observable("")
            @companies = ko.observableArray([])

            @prepDemo()

        scrollLéPanel: ->
            $('html,body').animate { scrollTop: ($(window).height() + $(window).scrollTop()) }, 600

        prepDemo: ->
            @workHeader("Past Work")
            @companies([
                {
                    demo: "http://i.imgur.com/fKQ6rtO.png",
                    link: "https://geo.itunes.apple.com/us/app/prepskc/id853112976?mt=8",
                    image: "http://i.imgur.com/W4wozQe.png",
                    name: "PrepsKC ProStat",
                    description: "ProStat is a live statistics app powered by PrepsKC for teams in the Kansas City metro area. CALIBER has been taking PrepsKC's stats tool through massive changes over the past few months, revving the app up for the upcoming season."
                },
                {
                    demo: "http://i.imgur.com/xEXhxGr.png",
                    link:"",
                    image: "http://i.imgur.com/4RFrot0.png",
                    name: "MyCutsTravel",
                    description: "MyCutsTravel is a mobile application that allows Tahki Bannister, a barber from the Kansas City and Lawrence Areas, to record his clients cuts along with allowing them to pay and see a history of previous cuts."
                },
                {
                    demo: "http://i.imgur.com/3PMI6Wj.png",
                    link:"",
                    image: "http://i.imgur.com/sMp6dyW.png",
                    name: "Bulletyn",
                    description: "Bulletyn is developing a smartphone app that’s designed to replace bulletin boards on college campuses by making it easier to get event listings, want ads and other information. CALIBER is working to expand functionality within the Bulletyn app, working with Bulletyn to improve their app's feature set and usability."
                },
                {
                    demo: "http://i.imgur.com/gORwuEn.png",
                    link:"",
                    image: "http://i.imgur.com/Zi8cNZe.png",
                    name: "uVest",
                    description: "uVest is a fintech startup looking to change the way people invest. CALIBER worked closely with the co-founders to design the first version of uVest's platform from basic wireframes to fully scaled design assets."
                }
                ])

    define('vm.Portfolio', Portfolio)
