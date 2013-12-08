define(['jquery'], ($) ->
  class Scene
    title: null
    objects: null
    
    constructor: (filepath) ->
      $.getJSON filepath, (json) ->
          console.log json
);