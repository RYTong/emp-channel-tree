EmpChannelTreeView = require './emp-channel-tree-view'

module.exports =
  empChannelTreeView: null

  activate: (state) ->
    @empChannelTreeView = new EmpChannelTreeView(state.empChannelTreeViewState)
    

  deactivate: ->
    @empChannelTreeView.destroy()

  serialize: ->
    empChannelTreeViewState: @empChannelTreeView.serialize()
