#= require lib/base.js.coffee
#= require lib/vm/page-content-viewmodel.js.coffee
#= require vendor/sc.min.js

do ->

    PageContentViewModel = require("lib.vm.PageContentViewModel")

    class Businesses extends PageContentViewModel
        constructor: ->
            super('views/contact/businesses')

            # First Section
            @panelHeader = ko.observable("")
            @panelImage = ko.observable("")

            @prepDemo()

        prepDemo: ->
            @panelHeader("Start Your Next Project Today.")
            @panelImage("http://i.imgur.com/nEVLFOz.jpg")


    define('vm.Businesses', Businesses)
