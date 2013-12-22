define(() -> 
  class Vector3f
    x: 0.0
    y: 0.0
    z: 0.0
    
    constructor: (x, y , z) ->
      @x = x
      @y = y
      @z = z
      
    distance: (point) ->
      return Math.sqrt(((@x - point.x) * (@x - point.x)) + ((@y - point.y) * (@y - point.y)) + ((@z - point.z) * (@z - point.z)))
)