define(() ->
  
  ###
  Based on glMatrix.js 
  ###
  
  class Matrix4
    array: null
    
    constructor: () ->
      array = new Array(16)

    identity: () ->
      mat = new Matrix4()
      mat.array = [1, 0, 0, 0,
                   0, 1, 0, 0,
                   0, 0, 1, 0,
                   0, 0, 0, 1]

    multiplyVec3: (vector) ->
      v = new Vector3f(0, 0, 0)
      v.x = @array[0] * vector.x + @array[4] * vector.y + @array[8] * vector.z + @array[12] * 1
      v.x = @array[1] * vector.x + @array[5] * vector.y + @array[9] * vector.z + @array[13] * 1
      v.x = @array[2] * vector.x + @array[6] * vector.y + @array[10] * vector.z + @array[14] * 1
      v

    multiplyDelta3: (vec) ->
      a_ = @multiplyVec3(new Vector3f(0, 0, 0))
      b_ = @multiplyVec3(vec)
      vec.sub b_, a_

    inverse: () ->
      inv = new Matrix4()
      
      inv.array[0] = @array[5]  * @array[10] * @array[15] - @array[5]  * @array[11] * @array[14] - @array[9]  * @array[6]  * @array[15] + @array[9]  * @array[7]  * @array[14] + @array[13] * @array[6]  * @array[11] - @array[13] * @array[7]  * @array[10]
      inv.array[4] = -@array[4]  * @array[10] * @array[15] + @array[4] * @array[11] * @array[14] + @array[8]  * @array[6] * @array[15] - @array[8]  * @array[7]  * @array[14] -  @array[12] * @array[6]  * @array[11] + @array[12] * @array[7] * @array[10]
      inv.array[8] = @array[4]  * @array[9] * @array[15] - @array[4]  * @array[11] * @array[13] - @array[8]  * @array[5] * @array[15] + @array[8]  * @array[7] * @array[13] + @array[12] * @array[5] * @array[11] - @array[12] * @array[7] * @array[9]
      inv.array[12] = -@array[4]  * @array[9] * @array[14] + @array[4]  * @array[10] * @array[13] + @array[8]  * @array[5] * @array[14] - @array[8]  * @array[6] * @array[13] - @array[12] * @array[5] * @array[10] + @array[12] * @array[6] * @array[9]
      inv.array[1] = -@array[1]  * @array[10] * @array[15] + @array[1]  * @array[11] * @array[14] + @array[9]  * @array[2] * @array[15] - @array[9]  * @array[3] * @array[14] - @array[13] * @array[2] * @array[11] + @array[13] * @array[3] * @array[10]
      inv.array[5] = @array[0]  * @array[10] * @array[15] - @array[0]  * @array[11] * @array[14] - @array[8]  * @array[2] * @array[15] + @array[8]  * @array[3] * @array[14] + @array[12] * @array[2] * @array[11] - @array[12] * @array[3] * @array[10]
      inv.array[9] = -@array[0]  * @array[9] * @array[15] + @array[0]  * @array[11] * @array[13] + @array[8]  * @array[1] * @array[15] - @array[8]  * @array[3] * @array[13] - @array[12] * @array[1] * @array[11] + @array[12] * @array[3] * @array[9]
      inv.array[13] = @array[0]  * @array[9] * @array[14] - @array[0]  * @array[10] * @array[13] - @array[8]  * @array[1] * @array[14] + @array[8]  * @array[2] * @array[13] + @array[12] * @array[1] * @array[10] - @array[12] * @array[2] * @array[9]
      inv.array[2] = @array[1]  * @array[6] * @array[15] - @array[1]  * @array[7] * @array[14] - @array[5]  * @array[2] * @array[15] + @array[5]  * @array[3] * @array[14] + @array[13] * @array[2] * @array[7] - @array[13] * @array[3] * @array[6]
      inv.array[6] = -@array[0]  * @array[6] * @array[15] + @array[0]  * @array[7] * @array[14] + @array[4]  * @array[2] * @array[15] - @array[4]  * @array[3] * @array[14] - @array[12] * @array[2] * @array[7] + @array[12] * @array[3] * @array[6]
      inv.array[10] = @array[0]  * @array[5] * @array[15] - @array[0]  * @array[7] * @array[13] - @array[4]  * @array[1] * @array[15] + @array[4]  * @array[3] * @array[13] + @array[12] * @array[1] * @array[7] - @array[12] * @array[3] * @array[5]
      inv.array[14] = -@array[0]  * @array[5] * @array[14] + @array[0]  * @array[6] * @array[13] + @array[4]  * @array[1] * @array[14] - @array[4]  * @array[2] * @array[13] - @array[12] * @array[1] * @array[6] + @array[12] * @array[2] * @array[5]
      inv.array[3] = -@array[1] * @array[6] * @array[11] + @array[1] * @array[7] * @array[10] + @array[5] * @array[2] * @array[11] - @array[5] * @array[3] * @array[10] - @array[9] * @array[2] * @array[7] + @array[9] * @array[3] * @array[6]
      inv.array[7] = @array[0] * @array[6] * @array[11] - @array[0] * @array[7] * @array[10] - @array[4] * @array[2] * @array[11] + @array[4] * @array[3] * @array[10] + @array[8] * @array[2] * @array[7] - @array[8] * @array[3] * @array[6]
      inv.array[11] = -@array[0] * @array[5] * @array[11] + @array[0] * @array[7] * @array[9] + @array[4] * @array[1] * @array[11] - @array[4] * @array[3] * @array[9] - @array[8] * @array[1] * @array[7] + @array[8] * @array[3] * @array[5]
      inv.array[15] = @array[0] * @array[5] * @array[10] - @array[0] * @array[6] * @array[9] - @array[4] * @array[1] * @array[10] + @array[4] * @array[2] * @array[9] + @array[8] * @array[1] * @array[6] - @array[8] * @array[2] * @array[5]
      
      det = @array[0] * inv.array[0] + @array[1] * inv.array[4] + @array[2] * inv.array[8] + @array[3] * inv.array[12]
      
      if (det == 0)
        console.error 'TRayx: HOUSTON WE GOT A FREAKIN DIV BY ZERO PROBLEM !'
        
      det = 1.0 / det
      
      for i in [0..16] by 1
        inv.array[i] = inv.array[i] * det
      
      inv
)