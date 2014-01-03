define(['app/Objects/Object', 'app/Types/Vector3f', 'app/Types/Matrix4', 'app/Types/ColorRGBA', 'app/Types/Ray', 'app/Tools/Tools'], (Object, Vector3f, Matrix4, ColorRGBA, Ray, Tools) ->
  class Sphere extends Object
    center: null
    radius: 0
    sqradius: 0
    color: null
    
    constructor: (@center, @radius, @color) ->
      @sqradius = @radius * @radius
      #no need to compute this each time we render

    collidesWith: (ray) ->
      # transform ray into object space
      # dir: (vec3.normalize mat4.multiplyDelta3 item.inverse, ray.dir)
      # origin: (mat4.multiplyVec3 item.inverse, ray.origin, [0, 0, 0])
      rayTr = clone(ray)
      
      mat = new Matrix4()
      ndir = new Vector3f(0, 0, 0)l
      npos = new Point3f(0, 0, 0)
      
      ndir = 
      
      rayTR.direction(ndir)
      

      # o = ray origin d = direction
      # c = sphere center
      A = ray.direction.dot(ray.direction)
      B = 2 * ray.direction.dot(ray.origin)
      origin = new Vector3f(ray.origin.x, ray.origin.y, ray.origin.z)
      C = origin.dot(origin) - (@sqradius)
      @getSolutions(A, B, C)
)