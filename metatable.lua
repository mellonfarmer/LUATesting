container ={}
element = 
{
    Height = 0,
    Width = 0,
    PositionX = 0,
    PositionY = 0,
    
    --PaddingTop =0,
    --PaddingBottom =0,
    --PaddingLeft =0,
    --PaddingRight =0,

}


function element:New(Height,Width,PositionX,PositionY)
    print("object created")
    o = o or {}
    setmetatable(o,self)
    self.__index=self
    self.Height = Height or 0
    self.Width = Width or 0
    self.PositionX = PositionX or 0
    self.PositionY = PositionY or 0
    
    
    
    return o
  
end  

--title = element:New(title,10,10,50,50)

--print(title.Name)
--print(title.Height)
--print(title.Width)
--print(title.PositionX)
--print(title.PositionY)

for i = 1,10  do
    table.insert(container,i,element:New(nil,(10+i),(10+i),(50+i),(50+i)))
end

print (container)

