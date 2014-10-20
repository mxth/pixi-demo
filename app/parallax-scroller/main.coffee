require [
  'pixi'
  'parallax-scroller/Scroller'
], (
  pixi
  Scroller
) ->
  stage = new pixi.Stage 0x66FF99
  elm = document.getElementById 'game-canvas'
  renderer = pixi.autoDetectRenderer elm.width, elm.height, elm

  scroller = new Scroller stage
  window.scroller = scroller
  update = ->
    scroller.moveViewPortXBy 5

    renderer.render stage

    requestAnimFrame update
    return

  requestAnimFrame update
  return
