function truncateNumber(toTruncate,length)
  length = length or 1
  return tonumber(string.format("%."..length.."f", toTruncate))  
end