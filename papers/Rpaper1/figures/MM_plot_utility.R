draw_MM_app0 = function(x, y, angle = 0, cex = 1, cex.x = cex, cex.y = cex, arr.length = .4){
  size.y = diff(par()$usr[3:4])/10 * cex.y
  size.x = diff(par()$usr[1:2])/10 * cex.x
  
  theta = angle / 360 * 2 * pi
  rotation.matrix = matrix(c(cos(theta), sin(theta), -sin(theta), cos(theta)), 2, 2)
  
  coords.x = c(0, -1, 0, 1, 0, -.2, .2, -.2, .2, 1, 1) * size.x/2 
  coords.y = c(0, 0, 1, 0, -1, .2, -.2, 1, 1, .2, -.2) * size.x/2
  
  coords = rotation.matrix %*% rbind(coords.x, coords.y) + c(x, y)
  
  shape::Arrows(coords[1,2], coords[2, 2], coords[1, 1], coords[2, 1], arr.adj = 1, arr.length = .1 * cex)
  shape::Arrows(coords[1,1], coords[2, 1], coords[1, 5], coords[2, 5], arr.adj = 1, arr.length = .1 * cex)
  
  segments(coords[1, 6], coords[2, 6], coords[1, 7], coords[2, 7])
  segments(coords[1, 1], coords[2, 1], coords[1, 3], coords[2, 3])
  segments(coords[1, 1], coords[2, 1], coords[1, 4], coords[2, 4])
  
  segments(coords[1, 8], coords[2, 8], coords[1, 9], coords[2, 9])
  segments(coords[1, 10], coords[2, 10], coords[1, 11], coords[2, 11])
  text(coords[1, 2], coords[2, 2], "a", adj = c(.5,-.2), xpd = TRUE)
  
  arc_arrow0(x, y, size.x/2 * 1.3, angle, arr.length = arr.length)
  
}

draw_MM_app = function(x, y, angle, arr.length = .4, ...){
  invisible(mapply(FUN = draw_MM_app0, x = x, y = y, angle = angle, arr.length = arr.length, MoreArgs = ...))
}


arc_arrow0 = function(x, y, radius, angle = 90, arr.length = .4, ...){
  if(angle == 0) return()
  head.ang = (angle + 90) / 180 * pi
  plotrix::draw.arc(x, y, radius, angle1 = pi/2, angle2 = head.ang, col = "gray", xpd = TRUE, ...)
  head.loc = c(x = radius * cos(head.ang), y = radius * sin(head.ang))
  shape::Arrowhead(x + head.loc["x"], y + head.loc["y"], angle = 180+angle + 180*(angle<0), arr.length = arr.length, arr.col  = "gray", lcol = "gray")
}

arc_arrow = function(x, y, radius, angle, arr.length = .4, ...){
  invisible(mapply(FUN = arc_arrow0, x = x, y = y, radius = radius, angle = angle, arr.length = arr.length, MoreArgs = ...))
}

detrend = function(v){
  n = length(v)
  b = (v[n] - v[1]) / (n - 1)
  v.pred = b * 0:(n-1) + v[1]
  v - v.pred
}
