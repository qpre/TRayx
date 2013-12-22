define(['jquery','app/Renderer/Renderer','app/Types/ColorRGBA','app/Types/Ray', 'app/Types/Point3f','app/Types/Vector3f'], ($, Renderer, ColorRGBA, Ray, Point3f, Vector3f) ->
  class Scene
    title: null
    objects: null
    renderer: null
    rays: null
    
    constructor: (filepath) ->
      # Let's load our scene
      $.getJSON filepath, (json) ->
          console.log json
      
      # set up renderer
      @renderer = new Renderer('TRayx')
      @rays = new Array()
      for i in [0..@renderer.imageData.width] by 1
        @rays[i] = new Array()
        for j in [0..@renderer.imageData.height] by 1
          position = new Point3f(i, j, 0)
          @rays[i][j] = new Ray(position)
          
      @run()
          
    run: () ->
      @render()
      @renderer.setPixel(Math.floor((Math.random()*800)), Math.floor((Math.random()*600)), new ColorRGBA(255, 0, 255, 255))
      @renderer.print()
      self = this
      requestAnimationFrame ->
        self.run()

    render: () ->
      console.log 'prout'
);
