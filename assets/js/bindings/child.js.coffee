#= require lib/base.js.coffee
#= require vendor/knockout.js
#= require lib/vm/viewmodel.js.coffee

do ->
   ViewModel = require("lib.vm.ViewModel")

   templateInit = ko.bindingHandlers.template.init
   templateUpdate = ko.bindingHandlers.template.update

   BOUND_ELEMENT = "child-boundElement"
   jstTemplateEngine = new ko.jstTemplateEngine()

   makeTemplateValueAccessor = (element, valueAccessor, viewModel) ->
      assertArgs(arguments, Node, Function, anything())
      value = ko.unwrap(valueAccessor())

      # If there is no value, just return null and don't do anything.
      return null unless value

      assertOfType(value, [String, ViewModel, Object])
      ifCondition = true

      if value instanceof ViewModel
         child = value
      else
         assertOfType(viewModel, ViewModel)

         if value instanceof Object and value.data
            assertOfType(value.data, [String, ViewModel])
            if value.data instanceof ViewModel
               child = value.data
            else
               child = ko.unwrap(viewModel.getChildObservable(value.data))
            ifCondition = value.if if value.if != undefined
         else
            child = ko.unwrap(viewModel.getChildObservable(value))

      return (-> {}) unless child

      currentChild = ko.utils.domData.get(element, BOUND_ELEMENT)
      if currentChild != child
         currentChild.unboundFromElement(element) if currentChild
         child.boundToElement(element)
         ko.utils.domData.set(element, BOUND_ELEMENT, child)

      return -> {
         name: child.template
         data: child
         templateEngine: jstTemplateEngine
         if: ifCondition
      }

   ko.bindingHandlers.child =
      init: (element, valueAccessor, allBindings, viewModel, bindingContext) ->
         ko.utils.domNodeDisposal.addDisposeCallback element, ->
            currentChild = ko.utils.domData.get(element, BOUND_ELEMENT)
            currentChild.unboundFromElement(element) if currentChild

         if accessor = makeTemplateValueAccessor(element, valueAccessor, bindingContext.$data)
            return templateInit(element, accessor, allBindings, viewModel, bindingContext)

      update: (element, valueAccessor, allBindings, viewModel, bindingContext) ->
         if accessor = makeTemplateValueAccessor(element, valueAccessor, bindingContext.$data)
            return templateUpdate(element, accessor, allBindings, viewModel, bindingContext)
