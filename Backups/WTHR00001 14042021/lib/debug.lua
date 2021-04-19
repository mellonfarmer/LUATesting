function dbgDrawGrid(size, color)
	--Graphics.drawLine(10, 25, 100, 250, Color.new(25, 200, 120))
	--debug gride for placing elements
	--size 32 and 64
	size = size or 32
	color = color or Color.new(65, 65, 65)

	--too tired to work out maths
	local amount = SCREEN_WIDTH / size
  local acc = 0
   --x
  --Graphics.debugPrint(0,0,amount, ColourWhite)
	for g = 0,amount do
    
		--Graphics.drawLine(acc ,SCREEN_HEIGHT,0,0, color)
    Graphics.drawLine(acc,acc ,0,SCREEN_HEIGHT, color)
    acc = acc + size
	end
  --void Graphics.drawLine	(x1,x2,y1,y2,int 	color)		

  
  --y
  amount = SCREEN_HEIGHT / size
  acc = 0
  
  for g = 0,amount do
		Graphics.drawLine( 0,SCREEN_WIDTH ,acc,acc, color)
    acc = acc + size
	end
  
end


function dbgDrawFullGrid()
  
  --draws 3 grids of diffrent sizes 16,32,64
  dbgDrawGrid(16,Color.new(127,127,127))
  dbgDrawGrid(32)
  dbgDrawGrid(64,ColourWhite)
end


function dbgDrawRect(x,xs,y,ys,color,DEBUG)
	--half area add origin -center
 
	local xs = xs + x

	local ys = ys + y
	local dbgy = (ys)+10

	local DEBUG = DEBUG or false

	if DEBUG == true then
		Graphics.debugPrint(x,dbgy,"x: "..x.." xs: "..xs.." y: "..y.." xy: "..ys, ColourWhite)
	end
  if showElementBoundingBox == true then
    Graphics.fillRect(x, xs, y, ys, color)
  end
end
