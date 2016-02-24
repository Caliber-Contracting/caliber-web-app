#= require lib/base.js.coffee

do ->
   class Observer
      constructor: (@callback, @keys) ->
         assertArgs(arguments, Function, [arrayOf(String)])

      isListeningForKey: (key) ->
         assertArgs(arguments, String)
         return true if @keys.length == 0
         for k in @keys
            return true if key.indexOf(k) == 0
         return false

   class ObservableData
      constructor: (data) ->
         assertOfType(data, [undefined, null, Object])
         @data = data or {}
         @observers = []

      observe: (callback, keyOrKeys) ->
         assertArgs(arguments, Function, [arrayOf(String), String, null])
         keys = null
         if keyOrKeys instanceof Array
            keys = keyOrKeys
         else
            keys = []
            keys.push(keyOrKeys) if isOfType(keyOrKeys, String)

         @observers.push(new Observer(callback, keys))

      get: (key) ->
         assertArgs(arguments, String)
         [cur, last] = @getNode_(key)
         return if cur[last] != undefined then cur[last] else null

      set: (key, val) ->
         assertArgs(arguments, String, anything())
         [cur, last] = @getNode_(key)
         oldVal = cur[last] || null
         cur[last] = val
         @notify_(key, oldVal, val)

      getNode_: (key) ->
         assertArgs(arguments, String)
         parts = key.split(".")
         cur = @data
         for i in [0...parts.length - 1]
            part = parts[i]
            cur[part] = {} unless cur[part]
            cur = cur[part]
         return [cur, parts[parts.length - 1]]

      notify_: (key, oldVal, newVal) ->
         assertArgs(arguments, String, anything(), anything())
         for observer in @observers
            if observer.isListeningForKey(key)
               observer.callback(key, oldVal, newVal)


   define("lib.utils.ObservableData", ObservableData)
   define("lib.utils.ObservableData.Observer", Observer)
