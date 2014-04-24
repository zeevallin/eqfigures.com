#= require jquery
#= require jquery_ujs
#= require_tree .

$ ->
  $('a[href^="#"]').on 'click.smoothscroll', (e) ->
    e.preventDefault()

    target = @hash
    $target = $(target)

    if $target[0]
      $('html, body').stop().animate({
        'scrollTop': $target.offset().top
      }, 500, 'swing', ->
        window.location.hash = target
      )

  bindRemoteLinks()
  resizeChoices()

window.resizeChoices = ->
  $('section#choices').css('height', $(window).innerHeight())


window.bindRemoteLinks = ->
  $('.choices .choice a').bind 'ajax:before', (e, xhr, status) ->
    $('#choices').addClass('loading')
    $('#choices .choice.skip figcaption span').text("WAIT")

  $('.choices .choice a').bind 'ajax:complete', (e, xhr, status) ->
    $('#choices').replaceWith(xhr.responseText)
    loadRemoteLinks()
    bindRemoteLinks()
    resizeChoices()

window.loadRemoteLinks = ->
  rails = $.rails
  $(document).delegate rails.linkClickSelector, "click.rails", (e) ->
    link = $(this)
    method = link.data("method")
    data = link.data("params")
    metaClick = e.metaKey or e.ctrlKey
    return rails.stopEverything(e)  unless rails.allowAction(link)
    rails.disableElement link  if not metaClick and link.is(rails.linkDisableSelector)
    if link.data("remote") isnt `undefined`
      return true  if metaClick and (not method or method is "GET") and not data
      handleRemote = rails.handleRemote(link)

      # response from rails.handleRemote() will either be false or a deferred object promise.
      if handleRemote is false
        rails.enableElement link
      else
        handleRemote.error ->
          rails.enableElement link
          return

      false
    else if link.data("method")
      rails.handleMethod link
      false

