#= require lib/base.js.coffee
#= require vendor/jquery.js

do ->
   Format = {}
   Format.kilobytes = (kilobytes) ->
      assertArgs(arguments, Number)
      size = kilobytes
      units = ["KB", "MB", "GB", "TB"]
      cur = 0
      while size > 1000 and cur < units.length - 1
         size /= 1000
         cur++
      return "#{size.toFixed(1).replace(".0", "")} #{units[cur]}"


   define("lib.utils.Format", Format)
