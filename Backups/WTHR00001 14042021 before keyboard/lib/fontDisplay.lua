function printfontStyled(x,y,size,text,font,color)
	size=size or 40
	font = font or fntRoboto

	Font.setPixelSizes(font,size)
	Font.print(font,x,y,text,color)
end