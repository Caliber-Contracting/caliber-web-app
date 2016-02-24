#= require vendor/insist.js.ejs
#= require testing.js.coffee.ejs

do (scope = @) ->
   root = {}

   ###
    * Defines a namespace.
    * @param {string} namespace
    * @param {Object} obj
   ###
   scope.define = (namespace, obj) ->
      namespace = namespace.replace(/\./g, '$')
      throw Error("Namespace already exists: #{namespace}") if root[namespace]
      root[namespace] = obj

   ###
    * Returns the namespace or throws an error if not found.
    * @param {string} namespace
    * @return {Object}
   ###
   scope.require = (namespace) ->
      namespace = namespace.replace(/\./g, '$')
      throw Error("Unknown namespace: #{namespace}") unless root[namespace]
      return root[namespace]

   scope.assertArgs = insist.args
   scope.assertOfType = insist.ofType
   scope.assertType = insist.isType
   scope.isValidType = insist.isValidType
   scope.isOptionalType = insist.isOptionalType
   scope.getNameForValue = insist.getNameForValue
   scope.getNameForType = insist.getNameForType
   scope.isOfType = insist.isOfType
   scope.arrayOf = insist.arrayOf
   scope.nullable = insist.nullable
   scope.anything = insist.anything
   scope.optional = insist.optional
