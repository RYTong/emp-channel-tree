{$, View} = require 'atom'

module.exports =
class EmpChannelTreeView extends View
  @content: ->
    @div class: 'emp-channel-tree overlay from-top', =>
      @div "The EmpChannelTree package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "emp-channel-tree:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "EmpChannelTreeView was toggled!"
    if @hasParent()
      @detach()
    else
      @tree_state()
      atom.workspaceView.append(this)

  tree_state: ->
    tmp_tree_view = atom.workspaceView.find('.tree-view')
    if tmp_tree_view
      console.log "exist tree"
      # console.log tmp_tree_view
      # console.log tmp_tree_view.getPath()
      # console.log tmp_tree_view.list
      @test2()

  test2: ->
      {@treeView} = require(atom.packages.getLoadedPackage('tree-view').path)
      tmp_path = "/work/code/ide/packages/tree-test/"
      if @treeView?
        # console.log atom.project.getRepo()
        # getSubdirectory
        tmp_dictory = atom.project.getRootDirectory()
        console.log atom.project.getRootDirectory()
        tmp_dictory.getEntriesSync().map(@test4)
        # console.log tmp_dictory.getEntriesSync()
        # console.log @treeView.list
        console.log @treeView.list.find(".entry").toArray().reduce(@test3, @treeView.root)
        # @treeViewScroller = @treeView.find('.tree-view-scroller')
        # @treeViewScroller.on 'scroll', @treeViewScrolled
        # @treeViewScrolled()
        # @breadcrumb.on 'click', '.btn', (e) =>
        #   target = $(e.target).data('target')
        #   item = @treeView.find("[data-path='#{target}']")
        #   @scrollToItem(@treeView.find("[data-path='#{target}']"))
  test3: (bestMatchEntry, element) ->
      entry = $(element).view()
      if entry.getPath().length > bestMatchEntry.getPath().length
        console.log "2"
        entry
      else
        console.log "3"
        bestMatchEntry

  test4: (node) ->
    console.log  node.getEntriesSync()
