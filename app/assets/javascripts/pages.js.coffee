# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  container = $('<ul>')
  $('.gitdevelopers').append container
  $.getJSON 'https://api.github.com/repos/cscu/cscu-library/contributors', (contributors) ->
    contributors.forEach (contributor) ->
      item = $("<li class=\"contributor\">")
      $.getJSON contributor.url, (user) ->
        link = $("<a href=\"#{user.html_url}\">")
        link.append $("<img src=#{user.avatar_url}>")
        link.append $("<span>#{user.name}</span>")
        link.appendTo(item)
      item.appendTo(container)

