--x,y,h,w
--getArea,getCenter

--setPadding

--showBoxes

local basicElement = {}

basicElement.new = function(x,y,h,w)
  local self = {}
  self.x = x or 0
  self.y = y or 0
  self.h = h or 0
  self.w = w or 0
  
  
  function self.getCenter() 
    local cx = (w/2)+x
    local cy = (h/2)+y

    return cx,cy
  end
  
  function setPadding(l,r,t,b)
  
  end

  function self.getArea()
      return (w*h)
  end
  --print(cx.." "..cy)
  
  
  return self
end

local to = basicElement.new(10,10,50,5)




function dbgDrawRect(x,xs,y,ys,color,DEBUG)
	--half area add origin -center
 
	local xs = xs + x

	local ys = ys + y
	local dbgy = (ys)+10

	local DEBUG = DEBUG or false

	if DEBUG == true then
		Graphics.debugPrint(x,dbgy,"x: "..x.." xs: "..xs.." y: "..y.." xy: "..ys, ColourWhite)
	end
  
  --showElementBoundingBox is defined in init.lua
  if showElementBoundingBox == true then
    Graphics.fillRect(x, xs, y, ys, color)
  end
end
