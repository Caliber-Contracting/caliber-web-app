#= require lib/base.js.coffee
#= require lib/vm/page-content-viewmodel.js.coffee
#= require vendor/sc.min.js

do ->

    PageContentViewModel = require("lib.vm.PageContentViewModel")

    class Students extends PageContentViewModel
        constructor: ->
            super('views/contact/students')

            # First Section
            @panelHeader = ko.observable("")
            @panelImage = ko.observable("")

            @prepDemo()

        prepDemo: ->
            @panelHeader("Start Your Career Now.")
            @panelImage("http://i.imgur.com/nEVLFOz.jpg")



    define('vm.Students', Students)
