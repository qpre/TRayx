define(["jquery", 'app/TRayx'], ($, TRayx) ->
  ###
    1) load json Scene
    2) compute collisons
    3) render canvas
  ###
  
  new TRayx ('assets/scenes/test.json')
);