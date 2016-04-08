#= require lib/base.js.coffee
#= require lib/vm/page-content-viewmodel.js.coffee
#= require vendor/sc.min.js

do ->

    PageContentViewModel = require("lib.vm.PageContentViewModel")

    class About extends PageContentViewModel
        constructor: ->
            super('views/about/about')

            # Founder Section
            @founderHeader = ko.observable("")
            @founders = ko.observableArray([])

            # Developer Section
            @developerHeader = ko.observable("")
            @developers = ko.observableArray([])

            @prepDemo()

        prepDemo: ->
            @founderHeader("Executive Team")
            @founders([
                {
                    image:"http://i.imgur.com/9nSL4B2.jpg",
                    name:"Grant Isom",
                    description:"With over three years of software consulting experience, and three internships over his fours years at KU, Grant runs Caliber's day to day operations including finances and customer relations.",
                    position: "Operations"
                },
                {
                    image:"http://i.imgur.com/lzt17Di.png?1",
                    name:"Cole Jurden",
                    description:"Cole has worked with companies such as TuneIn and Cerner in the past, and manages all the legal aspects of Caliber. He is also in charge of contract generation and B2B communication.",
                    position: "Operations"
                },
                {
                    image:"http://i.imgur.com/D9uIg4p.png",
                    name:"Evan Nichols",
                    description:"Evan has done design work for many KU organizations and Kansas City Startups, he also has worked with Garmin in the past. He runs recruitment and manages our student matching and vetting processes.",
                    position: "Lead Developer"
                }
                ])

            @developerHeader("Our Current Developers")
            @developers([
                {
                    image:"http://i.imgur.com/MgNVncE.jpg",
                    name:"Stefan Mendoza",
                    description:"Stefan is a senior in Computer Science with internships at IBM-funded startups. He is currently working on the ProStats iPad App for PrepsKC."
                },
                {
                    image:"http://i.imgur.com/yQKQaFT.jpg",
                    name:"Alex Ugarte",
                    description:"Alex currently works at Garmin while attending the University of Kansas. He comes from a visual design and art background with intern experience at Bazillion Pictures. He has his Associates in Computer Animation and is working on his Bachelor of Science in Computer Science."
                },
                {
                    image:"http://i.imgur.com/I0z50Wd.jpg",
                    name:"Wes Hoffman",
                    description:"Wes is a graduating Bachelor of Science undergraduate in Computer Science. His primarily interests and specialities is in the realm of data analytics, machine learning, and distributed computing."
                },
                ])

    define('vm.About', About)
