define ['pixi'], (pixi) ->

  DELTA_X = 0.128

  class Far extends pixi.TilingSprite
    constructor: ->
      texture = pixi.Texture.fromImage 'bg-far.png'
      super texture, 512, 256
      @position.x = 0
      @position.y = 0
      @tilePosition.x = 0
      @tilePosition.y = 0

      @viewPortX = 0
      return

    setViewPortX: (newViewPortX) ->
      distanceTravelled = newViewPortX - @viewPortX
      @viewPortX = newViewPortX
      @tilePosition.x -= (distanceTravelled * DELTA_X)
      return