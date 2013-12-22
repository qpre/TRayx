define(["app/Types/Vector3f"], (Vector3f) ->
  class Ray
    color: null
    position: null
    direction: null
    
    constructor: (position) ->
     @position = position

    position: (pos) ->
      @position = pos
     
    position: (x, y, z) ->
      if (@position == null)
        @position = new Vector3f(x, y, z)
      else
        @position.x = x
        @position.y = y
        @position.z = z
      
    direction: (dir) ->
      @direction = dir
      
    direction: (x, y, z) ->
      if (@direction == null)
        @direction = new Vector3f(x, y, z)
      else
        @direction.x = x
        @direction.y = y
        @direction.z = z
);