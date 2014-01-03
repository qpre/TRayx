define(['app/Types/ColorRGBA'], (ColorRGBA) ->
  class Object
    collidesWith: (ray) ->
      
    getSolutions: (a, b, c) ->
      d = b*b - 4*a*c
      if d < 0
        return []
      
      sqrtDelta = Math.sqrt d
      [(-b - sqrtdelta) / (2*a), (-b + sqrtdelta) / (2*a)]
)