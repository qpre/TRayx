define(() -> 
  class Vector3f
    x: 0.0
    y: 0.0
    z: 0.0
    
    ###
      constructor: default constructor for Point3f class
    
      @param {number} x the x value for the point
      @param {number} y the y value for the point
      @param {number} z the z value for the point
    ###
    constructor: (x, y , z) ->
      @x = x
      @y = y
      @z = z
      
    ###
      distance: Computes the distance between this point and an other
    
      @param {Point3f} point the point to be compared to
    ###
    distance: (point) ->
      return Math.sqrt(((@x - point.x) * (@x - point.x)) + ((@y - point.y) * (@y - point.y)) + ((@z - point.z) * (@z - point.z)))
)