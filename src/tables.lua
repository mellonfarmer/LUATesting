aTable = {}

function aTable:new(var1,var2,o)

	var1 = var1 or nil
	var2 = var2 or nil
	o = o or {}
return o
end

test = aTable:new(1,3)

print(test[0])
