{View} = require 'atom'

class CommitView extends View
  @content: (commit) ->
    @div class: 'commit', click: 'clicked', =>
      @div class: 'id', "#{commit.shortID()}"
      @div class: 'author-name', "(#{commit.authorName()})"
      @div class: 'message text-subtle', "#{commit.shortMessage()}"

  initialize: (@model) ->
    @model.on 'change:selected', @showSelection

  beforeRemove: =>
    @model.off 'change:selected', @showSelection

  clicked: =>
    @model.selfSelect()

  showSelection: =>
    @removeClass('selected')
    @addClass('selected') if @model.isSelected()

module.exports = CommitView
