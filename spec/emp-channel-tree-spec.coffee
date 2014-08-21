{WorkspaceView} = require 'atom'
EmpChannelTree = require '../lib/emp-channel-tree'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "EmpChannelTree", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('emp-channel-tree')

  describe "when the emp-channel-tree:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.emp-channel-tree')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'emp-channel-tree:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.emp-channel-tree')).toExist()
        atom.workspaceView.trigger 'emp-channel-tree:toggle'
        expect(atom.workspaceView.find('.emp-channel-tree')).not.toExist()
