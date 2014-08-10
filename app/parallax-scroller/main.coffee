require ['pixi'], (pixi) ->
  stage = new pixi.Stage 0x66FF99
  elm = document.getElementById 'game-canvas'
  renderer = pixi.autoDetectRenderer elm.width, elm.height, elm

  farTexture = pixi.Texture.fromImage 'bg-far.png'
  far = new pixi.TilingSprite farTexture, 512, 256
  far.position.x = 0
  far.position.y = 0
  far.tilePosition.x = 0
  far.tilePosition.y = 0
  stage.addChild far

  midTexture = pixi.Texture.fromImage 'bg-mid.png'
  mid = new pixi.TilingSprite midTexture, 512, 256
  mid.position.x = 0
  mid.position.y = 128
  mid.tilePosition.x = 0
  mid.tilePosition.y = 0
  stage.addChild mid

  update = ->
    far.tilePosition.x -= 0.128
    mid.tilePosition.x -= 0.64

    renderer.render stage

    requestAnimFrame update
    return

  requestAnimFrame update
  return
