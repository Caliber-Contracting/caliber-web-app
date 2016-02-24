#= require vendor/knockout.js

# Sets the ko template engine to use compiled Jade templates instead of searching the DOM for
# the template.
# Example take from: http://www.knockmeout.net/2011/10/ko-13-preview-part-3-template-sources.html

class ko.templateSources.jstTemplate
   constructor: (template) ->
      @data = {}
      @template = if typeof template == "string" then "templates/#{template}" else null

   data: (key, value) ->
      return @data[key] if arguments.length == 1
      @data[key] = value

   text: (value) ->
      # Unable to set template text, just return if attempting to set.
      return if arguments.length == 1
      return null unless @template
      throw Error('Template not found: ' + @template) unless JST[@template]
      return JST[@template]?(@data)

class ko.jstTemplateEngine extends ko.nativeTemplateEngine
   makeTemplateSource: (template) ->
      return new ko.templateSources.jstTemplate(template)

# ko.setTemplateEngine(new ko.jstTemplateEngine())
