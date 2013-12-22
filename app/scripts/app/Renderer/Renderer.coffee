define(() ->
  class Renderer
    imageData: null
    pixelData: null
    container: null
    context: null
    ###
      constructor: creates a new renderer
    
      @param {string} el_id the DOM canvas element for the renderer
                            to be attached to
    ###
    constructor: (el_id) ->
      @container = document.getElementById(el_id)
      @context = @container.getContext("2d")
      
      @imageData = @context.createImageData(800, 600)
      @pixelData = @imageData.data
      @initData()

    initData: () ->
      for i in [0..@pixelData.length] by 4
        @pixelData[i]    = 0
        @pixelData[i+1]  = 0
        @pixelData[i+2]  = 0
        @pixelData[i+3]  = 255
        
      @context.putImageData(@imageData, 0, 0)
      
    setPixel: (x, y, color) ->
      offset = (x + y) * 4
      if (offset < @pixelData.length)
        @pixelData[offset]      = color.r
        @pixelData[offset + 1]  = color.g
        @pixelData[offset + 2]  = color.b
        @pixelData[offset + 3]  = color.a
      else
        console.err "TRayx: trying to access overflown offset on pixel map"
)