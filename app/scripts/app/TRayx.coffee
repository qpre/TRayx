define(['jquery', "app/Scene/Scene"], ($, Scene) ->
  class TRayx
    scene: null
    
    constructor: (filepath) ->
      @scene = new Scene(filepath)
);
