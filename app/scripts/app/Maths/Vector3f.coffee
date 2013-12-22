define(["app/Maths/Point3f"], (Point3f) ->
  class Vector3f
    x: 0.0
    y: 0.0
    z: 0.0
    
    constructor: (x, y , z) ->
      @x = x
      @y = y
      @z = z
      
    createFromPoints: (p1, p2) ->
      return new Vector3f(p2.x - p1.x, p2.y - p1.y, p2.z - p1.z)
      
    add: (vector) ->
      return new Vector3f(@x + vector.x, @y + vector.y, @z + vector.z)
      
    sub: (vector) ->
      return new Vector3f(@x - vector.x, @y - vector.y, @z - vector.z)
      
    mult: (scalar) ->
      return new Vector3f(scalar * @x, scalar * @y, scalar * @z)
      
    length: () ->
      return Math.sqrt((@x * @x) + (@y * @y) + (@z * @z))
      
    normalize: () ->
      norm = @length()
      return new Vector3f(@x / norm, @y / norm, @z / norm)
      
    dot: (vector) ->
      return ((@x * vector.x) + (@y * vector.y) + (@z + vector.z))
      
    cross: (vector) ->
      x = (@y * vector.z) - (@z * vector.y)
      y = (@z * vector.x) - (@x * vector.z)
      z = (@x * vector.y) - (@y * vector.x)
      
      return new Vector3f(x, y, z)
)