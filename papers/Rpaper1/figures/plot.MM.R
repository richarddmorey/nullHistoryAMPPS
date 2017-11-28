source('read.MM.R')
source('MM_plot_utility.R')

par(mar = c(0,0,1,0))
layout(matrix(c(1,2,2,2,3,3,3,4,4,4), ncol = 1))

plot(0,0, ty='n',ylim = c(-1,1),xlim = c(-1,1),axes=FALSE)

for(i in 1:3){
  for(j in 1:10){
    x = (par()$usr[2] - par()$usr[1])/11*j + par()$usr[1]
    y = (par()$usr[4] - par()$usr[3])/4*i + par()$usr[3]
    shape::Arrows(x+.1,y,x,y, arr.width = .1)
  }
}

mtext("(aether wind direction)", 3, 0, adj=.5, cex = .8, xpd = TRUE )


par(mar = c(0,.5,.5,1))

plot(0,0, ylim = c(-1,1), xlim = c(-1.3,1.3), ty='n', asp = 1, axes = FALSE, ylab = "", xlab = "")

N = 5

angles = seq(0,-180,len = N) - 45
plot.xdist = diff(par()$usr[1:2])
xs = seq(par()$usr[1] + plot.xdist/20,par()$usr[2] - plot.xdist/20, len = N)
ys = xs * 0

draw_MM_app(xs, ys, angles, cex = 1, arr.length = .3)

par(mar = c(0,.5,.5,1))

plot(-detrend(noon[7,1:9]), ylim = c(-.05,.05), pch = 19, ty='l', lwd = 2, axes = FALSE, ylab = "", xlab = "")
abline(h=0:5*.01, col = "gray")
xx = seq(1,9,len = 250)
lines(xx, sin((xx - 1)/8*2*pi)*(.4/8), lty=2, xpd = TRUE)
text(7,0:5/100,paste("0.0",0:5, sep = ""), col = "grey", cex = .7)

text(3, .05, "1/8 of expected amplitude", adj = c(0,-.2), xpd = TRUE)

mtext("Noon", 3, 0, adj = 0, cex = 1.5)

plot(-detrend(evening[7,1:9]), ylim = c(-.05,.05), pch = 19, ty='l', lwd = 2, axes = FALSE, ylab = "", xlab = "")
abline(h=0:5*.01, col = "gray")
xx = seq(1,9,len = 250)
lines(xx, sin((xx - 1)/8*2*pi)*(.4/8), lty=2, xpd = TRUE)
text(7,0:5/100,paste("0.0",0:5, sep = ""), col = "grey", cex = .7)

mtext("Evening", 3, 0, adj = 0, cex = 1.3)



text(1, -.015, "N\nS", cex = .7)
text(5, -.015, "E\nW", cex = .7)
text(9, -.015, "S\nN", cex = .7)


### plotrix::draw.arc

