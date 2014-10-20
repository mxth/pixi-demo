define [
  'pixi'
  'parallax-scroller/Far'
  'parallax-scroller/Mid'
], (
  pixi
  Far
  Mid
) ->
  class Scroller
    constructor: (stage) ->
      @far = new Far()
      stage.addChild @far

      @mid = new Mid()
      stage.addChild @mid

      @viewPortX = 0
      return

    setViewPortX: (viewPortX) ->
      @viewPortX = viewPortX
      @far.setViewPortX viewPortX
      @mid.setViewPortX viewPortX
      return

    getViewPortX: -> @viewPortX

    moveViewPortXBy: (units) ->
      @setViewPortX @viewPortX + units
      return
