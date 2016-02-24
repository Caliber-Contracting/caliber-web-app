#= require lib/base.js.coffee
#= require vendor/jquery.js
#= require lib/utils/dom.js.coffee
#= require lib/utils/observable-data.js.coffee

do ->
   ObservableData = require("lib.utils.ObservableData")
   Dom            = require("lib.utils.Dom")

   class PanelManager
      constructor: ->

      initialize: ->


   define("lib.managers.PanelManager", PanelManager)
   define("lib.managers.PanelManager.Instance", new PanelManager())
