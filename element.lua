local basicElement = {}

basicElement.new = function(x,w,y,h)
  local self = {}
  self.x = x or 0
  self.y = y or 0
  self.h = h or 0
  self.w = w or 0

  --padding
  local pl,pr,pt,pb = 0,0,0,0
  local ml,mr,mt,mb = 0,0,0,0

  --padding second --padding is coord's plus padding

    --returns the calculated poision with all the padding and margin stuff added together
  function self.getPosition()
    local mtx = x + ml
    local mtw = w - mr
    local mty = y + mt
    local mth = h - mb
	return mtx,mtw,mty,mth
end

  function self.getContentPosition()
    local ptt = (x + ml) + pt
    local ptr = (w - mr) - pr
    local ptb = (h - mb) - pb
    local ptl = (y + mt) + pl
		return ptt,ptr,ptb,ptl
  end

  function self.getCenter()
    local cx = x - (w/2)
    local cy = x -(h/2)
    return cx,cy
  end

  function self.getPadding()
	return pl,pr,pt,pb
  end

  function self.getMargin()
	return ml,mr,mt,mb
  end

  function self.getArea()
      return (w*h)
  end



  function self.getOriginal()
    return x,w,y,h
  end

  function self.setPadding(fpl,fpr,fpt,fpb)
    pl = fpl or 0
    pr = fpr or 0
    pt = fpt or 0
    pb = fpb or 0
  end


  function self.setMargin(fml,fmr,fmt,fmb)
    ml = fml or 0
    mr = fmr or 0
    mt = fmt or 0
    mb = fmb or 0
  end


  --print(cx.." "..cy)
  function self.drawRect(color) --find out type enforcement
    local xs = x + ml
    local ys = y + mt
    color = color or Color.new(255,255,255)
    
    
    Graphics.fillRect(x, xs, y, ys, color)
  end



  function drawBoundingBox()
    local xs = xs + x
    local ys = ys + y


    --showElementBoundingBox is defined in init.lua
    if showElementBoundingBox == true then
      Graphics.fillRect(x, xs, y, ys, color)
    end

  end

  return self
end

collection = {menuItem1 = basicElement.new(10,100,20,600),menuItem2 = basicElement.new(210,210,250,250)}

for _,v in ipairs(collection) do
  --t1,t2 = v.getOriginal()
  --print(_,t1,t2)
  print(v.getOriginal())
end

print(collection[menuItem1].getOriginal())

--[[
local to = basicElement.new(10,10,50,5)


te = basicElement.new(40,40,40,40)
print(getOriginal())


print(te.getPadding())
te.setPadding(10,0,15,0)
print(te.getPadding())

print(te.getContentPosition())

print()
print(getOriginal())
           --x,w,y,h
te.setMargin(4,8,1,9)
print(te.getMargin())
te.setMargin(4,8,1,9)
print(te.getPosition())
]]--