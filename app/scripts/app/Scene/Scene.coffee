define(['jquery', 'app/Renderer/Renderer', 'app/Types/ColorRGBA'], ($, Renderer, ColorRGBA) ->
  class Scene
    title: null
    objects: null
    renderer: null
    
    constructor: (filepath) ->
      # Let's load our scene
      $.getJSON filepath, (json) ->
          console.log json
      
      # set up renderer
      @renderer = new Renderer('TRayx')
);
