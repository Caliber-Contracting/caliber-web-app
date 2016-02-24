#= require lib/base.js.coffee
#= require lib/vm/page-content-viewmodel.js.coffee
#= require models/slide.js.coffee

do ->

   PageContentViewModel = require("lib.vm.PageContentViewModel")
   Slide = require("models.Slide")

   class Slider extends PageContentViewModel
      constructor: (slides) ->
         assertArgs(arguments, optional(arrayOf(Slide)))
         super("components/slider/slider")
         @slides = slides
         @displayedSlides = ko.observableArray([])
         @canSlide = ko.observable()
         @displaySlides()

      # We init the slider so that it will only display 3 slides at a time.
      # In the case that there are less than three slides, we will simply
      # fill the Slider object with bogus Slide Objects.
      displaySlides: ->
         slideCount = @slides.length
         if slideCount == 3 then @canSlide(false) else @canSlide(true)

         # No need to push bogus slides.
         if slideCount >= 3
            for i in [0...3] by 1
               @displayedSlides.push(@slides[i])
         else
            fillerCount = 3 - (slideCount + 1)
            for i in [0...slideCount] by 1
               @displayedSlides.push(@slides[i])

            for i in [slideCount...fillerCount] by 1
               @displayedSlides.push(
                  new Slide({
                     id: ""
                     title: ""
                     description: ""
                     image: ""
                     is_visible: false
                     }))

      updateDisplayedSlides: ->
         # Clear out the displayed slides
         @displayedSlides.removeAll()

         # Repopulate the slides
         @displaySlides()

      scrollForward: ->
         unless !@canSlide()
            @slides.splice(0, 0, @slides.pop())
         @updateDisplayedSlides()

      scrollBackward: ->
         unless !@canSlide()
            @slides.push(@slides.shift())
         @updateDisplayedSlides()

      addSlide: (slide) ->
         assertOfType(slide, Slide)
         @slides.push(slide)
         @displaySlides()

   define('lib.components.Slider', Slider)
