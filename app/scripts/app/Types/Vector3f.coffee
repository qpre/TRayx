define(["app/Types/Point3f"], (Point3f) ->
  class Vector3f
    x: 0.0
    y: 0.0
    z: 0.0

    ###
      constructor: default constructor for Vector3f class
    
      @param {number} x the x value for the vector
      @param {number} y the y value for the vector
      @param {number} z the z value for the vector
    ###
    constructor: (x, y, z) ->
      @x = x
      @y = y
      @z = z

    ###
      methods for Vector3 Maths euclidian operations
    ###

    ###
      createFromPoints: generates a new vector based on two points
    
      @param {Point3f} p1 vector's "destination"
      @param {Point3f} p2 vector's "origin"
    ###
    createFromPoints: (p1, p2) ->
      return new Vector3f(p2.x - p1.x, p2.y - p1.y, p2.z - p1.z)
    
    ###
      add: Euclidian addition of two vectors
    
      @param {Vector3f} the vector to be added to
    ###
    add: (vector) ->
      return new Vector3f(@x + vector.x, @y + vector.y, @z + vector.z)

    ###
      sub: Euclidian substraction of two vectors
    
      @param {Vector3f} the vector to be substracted to
    ###
    sub: (vector) ->
      return new Vector3f(@x - vector.x, @y - vector.y, @z - vector.z)
    
    ###
      mult: Euclidian product of a vector and a scalar
    
      @param {number} the scalar to multiply to
    ###
    mult: (scalar) ->
      return new Vector3f(scalar * @x, scalar * @y, scalar * @z)

    ###
      length: Gets the vectors' norm
    ###
    length: () ->
      return Math.sqrt((@x * @x) + (@y * @y) + (@z * @z))

    ###
      dot: Euclidian dot product  of two vectors
    
      @param {Vector3f} the other vector
    ###
    dot: (vector) ->
      return ((@x * vector.x) + (@y * vector.y) + (@z + vector.z))
      
    ###
      dot: Euclidian cross product  of two vectors
   
      @param {Vector3f} the other vector
    ###
    cross: (vector) ->
      x = (@y * vector.z) - (@z * vector.y)
      y = (@z * vector.x) - (@x * vector.z)
      z = (@x * vector.y) - (@y * vector.x)
      
      return new Vector3f(x, y, z)

    ###
      normalize: Returns a normalized version of current vector
    ###
    normalize: () ->
      norm = @length()
      return new Vector3f(@x / norm, @y / norm, @z / norm)

)