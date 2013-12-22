define(['app/Types/Vector3f', 'app/Types/Point3f'], (Vector3f, Point3f) ->
  class Camera
    u: null
    v: null
    w: null
    
    fov: 45
    eyePos: null
    
    constructor: () ->
      @u = (new Vector3f(1, 0, 0)).normalize()
      @v = (new Vector3f(0, 1, 0)).normalize()
      @w = @u.cross(@v)
      
      eyeDistance = ((800 / 2) / Math.atan(@fov / 2))
      @eyePos = new Point3f(0, 0, -eyeDistance)
      console.log @eyePos
    
)