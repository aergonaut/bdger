$ ->
  $("#share_modal").on "shown", ->
    $("#share_link").select()

  $("#share_link").on "focus", ->
    $(this).select()

  $("#share_link").on "mouseup", (e) ->
    e.preventDefault()
