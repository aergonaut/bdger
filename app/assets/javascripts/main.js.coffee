$ ->
  $("[rel=external]").attr "target", "_blank"

  $(".inactive").click (e) ->
    e.preventDefault()