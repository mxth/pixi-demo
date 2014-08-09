require ['pixi', 'underscore'], (pixi, _) ->
  canPick = true
  firstTile = null
  secondTile = null
  stage = new pixi.Stage 0x888888
  renderer = pixi.autoDetectRenderer 640, 480
  tileAtlas = ['./pairs/images.json']
  loader = new pixi.AssetLoader tileAtlas
  gameContainer = new pixi.DisplayObjectContainer()
  stage.addChild gameContainer
  document.body.appendChild renderer.view

  animate = ->
    requestAnimFrame animate
    renderer.render stage
    return

  onTilesLoaded = ->
    randomizeTiles = ->
      tiles = []
      while tiles.length < 48
        candidate = _.random 44-1
        tiles.push candidate, candidate unless _(tiles).contains candidate

      _(tiles.length).times ->
        index = _.random @length-1
        tile = @[index]
        @splice index, 1
        tile
      , tiles

    chosenTiles = randomizeTiles()
    _(8).times (i) ->
      _(6).times (j) ->
        tile = pixi.Sprite.fromFrame chosenTiles[i*6+j]
        _(tile).extend
          buttonMode: true
          interactive: true
          isSelected: false
          theVal: chosenTiles[i*6+j]
          position:
            x: 7+i*80
            y: 7+j*80
          tint: 0x000000
          alpha: 0.5
        gameContainer.addChild tile
        tile.mousedown = tile.touchstart = ->
          if canPick
            unless @isSelected
              @isSelected = true
              @tint = 0xffffff
              @alpha = 1;
              if firstTile is null
                firstTile = @
              else
                secondTile = @
                canPick = false
                if firstTile.theVal is secondTile.theVal
                  setTimeout ->
                    gameContainer.removeChild firstTile
                    gameContainer.removeChild secondTile
                    firstTile = secondTile = null
                    canPick = true
                    return
                  , 1000
                else
                  setTimeout ->
                    clearTile =
                      isSelected: false
                      tint: 0x000000
                      alpha: 0.5
                    _(firstTile).extend clearTile
                    _(secondTile).extend clearTile
                    firstTile = secondTile = null
                    canPick = true
                    return
                  , 1000
          return

    requestAnimFrame animate
    return

  loader.onComplete = onTilesLoaded
  loader.load()
  return
