define ['pixi'], (pixi) ->
  class WallSpritesPool
    constructor: ->
      @windows = []

      @addWindowSprites 6, 'window_01'
      @addWindowSprites 6, 'window_02'

      @shuffle @windows
      return

    shuffle: (array) ->
      len = array.length
      shuffles = len * 3
      i = 0
      while i < shuffles
        i++
        wallSlice = array.pop()
        pos = Math.floor(Math.random() * (len - 1))
        array.splice pos, 0, wallSlice
      return

    addWindowSprites: (amount, frameId) ->
      i = 0
      while i < amount
        i++
        sprite = pixi.Sprite.fromFrame frameId
        @windows.push sprite

    borrowWindow: -> @windows.shift()

    returnWindow: (sprite) ->
      @windows.push sprite
      return