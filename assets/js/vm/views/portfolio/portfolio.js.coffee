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

        prepDemo: ->
            @workHeader("Our Past Work")
            @companies([
                {
                    image: "http://i.imgur.com/W4wozQe.png",
                    name: "PrepsKC ProStat",
                    description: "ProStat is a live statistics app powered by PrepsKC for teams in the Kansas City metro area. Caliber has been taking PrepsKC's stats tool through massive changes over the past few months, revving the app up for the upcoming season."
                },
                {
                    image: "http://i.imgur.com/4RFrot0.png",
                    name: "MyCutsTravel",
                    description: "MyCutsTravel is a mobile application that allows Tahki Bannister, a barber from the Kansas City and Lawrence Areas, to record his clients cuts along with allowing them to pay and see a history of previous cuts."
                },
                {
                    image: "http://i.imgur.com/mAoTYr0.png",
                    name: "Bulletyn",
                    description: "Bulletyn is developing a smartphone app that’s designed to replace bulletin boards on college campuses by making it easier to get event listings, want ads and other information."
                }
                ])

    define('vm.Portfolio', Portfolio)
