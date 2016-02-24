#= require lib/base.js.coffee
#= require vendor/jquery.js

do ->
   Dom = {}
   Dom.getTemplateString = (template) ->
      assertArgs(arguments, String)
      name = "templates/#{template}"
      return null unless JST[name]
      return JST[name]()

   Dom.convertTextToHtml = (text) ->
      assertArgs(arguments, String)
      return text.replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/\n/g, "<br>")

   Dom.elementHasTransition = (element) ->
      assertArgs(arguments, Node)
      transitionStyle = $(element).css("transition")
      return false unless transitionStyle.length

      transitions = transitionStyle.split(",")
      return false unless transitions.length
      
      for transition in transitions
         segments = transition.trim().split(" ")
         rates = [segments[1], segments[3]]
         for rate in rates
            rate = parseFloat(rate.replace(/[a-zA-Z]/g, "")) * 100
            if Math.abs(rate) > 0
               return true
      return false

   Dom.scrollIntoViewIfNeeded = (element, centerIfNeeded) ->
      assertArgs(arguments, Node, optional(Boolean))
      centerIfNeeded = true if centerIfNeeded == undefined or centerIfNeeded == null

      # Use native function if it exists.
      # if element.scrollIntoViewIfNeeded
      #    return element.scrollIntoViewIfNeeded(centerIfNeeded)

      parent = element.offsetParent
      parentComputedStyle = window.getComputedStyle(parent, null)
      parentBorderTopWidth = parseInt(parentComputedStyle.getPropertyValue("border-top-width"))
      parentBorderLeftWidth = parseInt(parentComputedStyle.getPropertyValue("border-left-width"))
      
      elementBottom = (element.offsetTop - parent.offsetTop + element.clientHeight -
            parentBorderTopWidth)
      elementRight = (element.offsetLeft - parent.offsetLeft + element.clientWidth -
            parentBorderLeftWidth)

      overTop = (element.offsetTop - parent.offsetTop) < parent.scrollTop
      overBottom = elementBottom > (parent.scrollTop + parent.clientHeight)
      overLeft = element.offsetLeft - parent.offsetLeft < parent.scrollLeft
      overRight = elementRight > (parent.scrollLeft + parent.clientWidth)
      alignWithTop = overTop && !overBottom;
 
      if ((overTop or overBottom) and centerIfNeeded)
         parent.scrollTop = (element.offsetTop - parent.offsetTop - parent.clientHeight / 2 -
               parentBorderTopWidth + element.clientHeight / 2)
      
      if ((overLeft or overRight) and centerIfNeeded)
         parent.scrollLeft = (element.offsetLeft - parent.offsetLeft - parent.clientWidth / 2 -
               parentBorderLeftWidth + element.clientWidth / 2)
    
      if ((overTop or overBottom or overLeft or overRight) and !centerIfNeeded)
         element.scrollIntoView(alignWithTop)


   define("lib.utils.Dom", Dom)
