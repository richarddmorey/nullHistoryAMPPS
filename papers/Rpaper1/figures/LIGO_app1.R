
q = 1.5
n = 17
r = 1/q * .8
g = .3

theta = seq(0,2*pi, len = n)[-n]
x0 = r*cos(theta)
y0 = r*sin(theta)


layout(matrix(c(rep(1,4),rep(2:5,5)),6,4,byrow = TRUE))

par(mar = c(0,0,0,0))

plot(0,0,ylim = c(-1,1), xlim = c(-1,1), axes=FALSE, ylab = "", xlab = "", ty='n')

shape::Arrows(-.5,-.5,.5,-.5,lwd=2)
text(0,.25,"Time",adj=.5,cex=2)


plot(x0,y0, ylim = c(-1,1), xlim = c(-1,1), asp = TRUE, ty='n', axes = FALSE, ylab = "",xlab="")


segments(0,0,0,g, col = "red", lwd = 2)
segments(0,0,g,0, col = "red", lwd = 2)


mtext("time 1",1,-1,adj=.5)


x1 = x0 / q
y1 = y0 * q



plot(x0,y0, ylim = c(-1,1), xlim = c(-1,1), asp = TRUE, ty='n', axes = FALSE, ylab = "",xlab="")
shape::Arrows(x0,y0,x1,y1, col = rgb(0,0,0,.5), arr.length = .2)

segments(0,0,0,g*q, col = "red", lwd = 2)
segments(0,0,g/q,0, col = "red", lwd = 2)


mtext("time 2",1,-1,adj=.5)



plot(x0,y0, ylim = c(-1,1), xlim = c(-1,1), asp = TRUE, ty='n', axes = FALSE, ylab = "",xlab="")


segments(0,0,0,g, col = "red", lwd = 2)
segments(0,0,g,0, col = "red", lwd = 2)


mtext("time 3",1,-1,adj=.5)


x1 = x0 * q
y1 = y0 / q


plot(x0,y0, ylim = c(-1,1), xlim = c(-1,1), asp = TRUE, ty='n', axes = FALSE, ylab = "",xlab="")
shape::Arrows(x0,y0,x1,y1, col = rgb(0,0,0,.5), arr.length = .2)

segments(0,0,0,g/q, col = "red", lwd = 2)
segments(0,0,g*q,0, col = "red", lwd = 2)

mtext("time 4",1,-1,adj=.5)
