#= require lib/base.js.coffee
#= require lib/vm/viewmodel.js.coffee
#= require lib/vm/control-viewmodel.js.coffee

do ->
   ViewModel = require("lib.vm.ViewModel")
   ControlViewModel = require("lib.vm.ControlViewModel")

   class PageContentViewModel extends ViewModel
      constructor: (template, title, subtitle) ->
         assertArgs(arguments, optional(String), optional(String), optional(String))
         super(template)
         @controlSetsInternal_ = {}
         @controlSets_ = {}
         @titleInternal_ = ko.observable(title or "")
         @subtitleInternal_ = ko.observable(subtitle or "")
         # Title is either the title set by this view model or bubbles up from a child.
         @title = ko.pureComputed =>
            internalTitle = @titleInternal_()
            return internalTitle if internalTitle and internalTitle.length
            for k, child of @getChildren()
               childTitle = child.title()
               return childTitle if childTitle and childTitle.length
            return ""
         # Subtitle is either the title set by this view model or bubbles up from a child.
         @subtitle = ko.pureComputed =>
            internalSubtitle = @subtitleInternal_()
            return internalSubtitle if internalSubtitle and internalSubtitle.length
            for k, child of @getChildren()
               childSubtitle = child.subtitle()
               return childSubtitle if childSubtitle and childSubtitle.length
            return ""

      setTitle: (title) ->
         assertArgs(arguments, String)
         @titleInternal_(title)

      setSubtitle: (subtitle) ->
         assertArgs(arguments, String)
         @subtitleInternal_(subtitle)

      getControlSetObservable: (key) ->
         assertArgs(arguments, String)
         unless @controlSets_[key]
            @controlSets_[key] = ko.pureComputed =>
               set = @getControlSetInternalObservable_(key)()
               for k, child of @getChildren()
                  if child instanceof PageContentViewModel
                     observable = child.getControlSetObservable(key)
                     set = set.concat(observable())
               set.sort(@sortByOrder_)
               return set
         return @controlSets_[key]

      getControlSetInternalObservable_: (key) ->
         assertArgs(arguments, String)
         unless @controlSetsInternal_[key]
            @controlSetsInternal_[key] = ko.observableArray()
         return @controlSetsInternal_[key]

      addControl: (key, control) ->
         assertArgs(arguments, String, ControlViewModel)
         if set = @controlSetsInternal_[key]
            set.push(control)
         else
            @controlSetsInternal_[key] = ko.observableArray([control])

      removeControl: (key, control) ->
         assertArgs(arguments, String, ControlViewModel)
         @controlSetsInternal_[key].remove(control) if @controlSetsInternal_[key]

      sortByOrder_: (a, b) ->
         assertArgs(arguments, ControlViewModel, ControlViewModel)
         orderA = a.order()
         orderB = b.order()
         return -1 if orderA < orderB
         return 0 if orderA == orderB
         return 1


   define('lib.vm.PageContentViewModel', PageContentViewModel)
