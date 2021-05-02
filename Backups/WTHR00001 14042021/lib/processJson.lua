function processJson(jsonData)
L=jsonData:gsub('%[','')
L=L:gsub(']','')
L="return "..L:gsub('("[^"]-"):','[%1]=')

T= assert(loadstring(L))()

return T

end
