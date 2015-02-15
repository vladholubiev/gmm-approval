Template.header.rendered = ->
  highlightSelectedNavigationBarSection.call this

highlightSelectedNavigationBarSection = ->
  sections = this.$('li')
  sections.on 'click', ->
    sections.removeClass 'active'
    $(this).addClass 'active'
  this.$('.navbar-brand').on 'click', ->
    sections.removeClass 'active'