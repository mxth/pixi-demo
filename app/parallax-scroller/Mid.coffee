define ['pixi'], (pixi) ->

  DELTA_X = 0.64

  class Far extends pixi.TilingSprite
    constructor: ->
      texture = pixi.Texture.fromImage 'bg-mid.png'
      super texture, 512, 256
      @position.x = 0
      @position.y = 128
      @tilePosition.x = 0
      @tilePosition.y = 0

      @viewPortX = 0

    setViewPortX: (newViewPortX) ->
      distanceTravelled = newViewPortX - @viewPortX
      @viewPortX = newViewPortX
      @tilePosition.x -= (distanceTravelled * DELTA_X)
      return