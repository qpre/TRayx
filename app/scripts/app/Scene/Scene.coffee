define(['jquery','app/Renderer/Renderer','app/Types/ColorRGBA','app/Types/Ray', 'app/Types/Point3f','app/Types/Vector3f', 'app/Scene/Camera'], ($, Renderer, ColorRGBA, Ray, Point3f, Vector3f, Camera) ->
  class Scene
    title: null
    objects: null
    renderer: null
    camera: null
    rays: null
    description: null
    
    constructor: (filepath) ->
      # Let's load our scene
      self = this
      $.getJSON filepath, (json) ->
          self.description = json
          console.log json
          # set up renderer
          self.camera = new Camera()
          self.renderer = new Renderer('TRayx')
          self.rays = new Array()
          for i in [0..799] by 1
            self.rays[i] = new Array()
            for j in [0..599] by 1
              position = new Point3f(i, j, 0)
              direction = (new Vector3f(position, self.camera.eyePos)).normalize()
              self.rays[i][j] = new Ray(position)

          self.run()
          
    run: () ->
      @renderer.clearData()
      # compute me !
      @render()
      # dump pixel data into canvas
      @renderer.print()
      self = this
      requestAnimationFrame ->
        self.run()

    render: () ->
      for x in [0..799] by 1
        for y in [0..599] by 1
          @rays[x][y].collisions()
          @renderer.setPixel(x, y, @rays[x][y].color)

      # setup rays position and direction
      # launch rays
      # cool story bro
);
