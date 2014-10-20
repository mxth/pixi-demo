require [
  'pixi'
  'parallax-scroller/Scroller'
  'parallax-scroller/WallSpritesPool'
], (
  pixi
  Scroller
  WallSpritesPool
) ->
  class Main
    constructor: ->
      @stage = new pixi.Stage 0x66FF99
      elm = document.getElementById 'game-canvas'
      @renderer = pixi.autoDetectRenderer elm.width, elm.height, elm

      @loadSpriteSheet()
      return

    spriteSheetLoaded: =>
      @scroller = new Scroller @stage
      update = =>
        @scroller.moveViewPortXBy 5

        @renderer.render @stage

        requestAnimFrame update
        return
      requestAnimFrame update

      @pool = new WallSpritesPool()
      @wallSlices = []
      return

    loadSpriteSheet: ->
      assetsToLoad = ['resources/wall.json', 'resources/bg-mid.png', 'resources/bg-far.png']
      loader = new pixi.AssetLoader assetsToLoad
      loader.onComplete = @spriteSheetLoaded
      loader.load()
      return

    borrowWallSprites: (num) ->
      i = 0
      while i < num
        sprite = @pool.borrowWindow()
        sprite.position.x = -32 + (i * 64)
        sprite.position.y = 128
        i++

        @wallSlices.push sprite

        @stage.addChild sprite
      return

    returnWallSprites: ->
      for sprite in @wallSlices
        @stage.removeChild sprite
        @pool.returnWindow sprite
      @wallSlices = []
      return

  window.main = new Main()
  return
