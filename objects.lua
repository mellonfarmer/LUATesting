element= {x=0,w=0,y=0,h=0}
element.proto = {x=0,w=0,y=0,h=0}
element.mt= {}

function element.new(x,w,y,h)
	local x = x or 0
	local w = w or 0
	local y = y or 0
	local h = h or 0

	local values = {x,w,y,h}
	local elem = {}
	setmetatable(elem,element.mt)
	for i,v in pairs (element) do
		elem[i] = v
	end
	return elem
end


elm = element.new(90,500,80,700)

--print(elm.x,elm.w,elm.y,elm.h)


q,w,e,r = 10,10,10,10

print(q,w,e,r)
