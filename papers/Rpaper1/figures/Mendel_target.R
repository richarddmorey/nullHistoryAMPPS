
#source('data/read.edwards.R',chdir = TRUE)

#use = c(1,2)
#y = dat$obs1[use]
#N = dat$total[use]
#p = exp.p[use]

y = c(5474, 6022) 
N = c(7324, 8023)
p = c(.75,.75)


se = sqrt(N*p*(1-p))

z = (y - N*p)/se
z.round = round(z,2)

par(mfrow = c(1,2))

plot(0,0,ylim = c(-1,1)*.75, xlim = c(-1,1)*.75, axes = FALSE, ty='n', 
     xlab = "Experiment 1", ylab = "Experiment 2", asp=TRUE, las = 1)

ang.txt = 3*pi/2
for(r in seq(.25,1.5,.25)){
  plotrix::draw.circle(0,0,r,nv = 300, border = NA, col = rgb(0,0,0,.1))
  x0 = r * cos(ang.txt)
  y0 = r * sin(ang.txt)
  text(x0,y0,paste(r,"se",sep=""), col = "darkgray", cex = .8)
}

r0 = seq(.5,1.5,.5)
axis(1, at = c(-rev(r0),r0), lab = paste(c(-rev(r0),paste("+",r0,sep="")),"se",sep=""))
axis(1, at = 0, lab = expression(p[1]))

axis(2, at = c(-rev(r0),r0), lab = paste(c(-rev(r0),paste("+",r0,sep="")),"se",sep=""), las = 1)
axis(2, at = 0, lab = expression(p[2]), las = 1)

points(z[1],z[2], pch = 21, bg = "red", col="black")
segments(0,0,0,z[2], lty = 1)
segments(0,z[2],z[1],z[2], lty = 1)
segments(0,0,z[1],z[2], lty = 2)
#text(z[1]/2,z[2],substitute(z[1]==z0, list(z0=z.round[1])), adj = c(.5,-.2), cex = .8)
#text(0,z[2]/2,substitute(z[2]==z0, list(z0=z.round[2])), adj = c(-.1,.5), cex = .8)

text(z[1]/2,z[2],"a", adj = c(.5,-.4), cex = .8)
text(0,z[2]/2,"b", adj = c(-.4,.5), cex = .8)


r0 = sqrt(sum(z^2))/2
theta = atan(abs(z[1])/z[2]) + pi/2

#text(r0*cos(theta), r0*sin(theta), 
#     substitute(sqrt(z[1]^2+z[2]^2)==sqrt(z0), list(z0 = round(sum(z^2),2))), 
#     srt = theta*180/pi,
#     adj=c(1.2,1.3), cex = .8)

text(r0*cos(theta), r0*sin(theta), "c", adj=c(.5,1.4), cex = .8)

#text(par()$usr[1],par()$usr[4],substitute(paste("a : ", z[1]==z0), list(z0=z.round[1])), adj = c(0,1), cex = .8)
text(par()$usr[1],par()$usr[4],substitute(paste("a : ", z[1]==z0), list(z0=z.round[1])), adj = c(-.1,1.1), cex = .8)
text(par()$usr[1],par()$usr[4],substitute(paste("b : ", z[2]==z0), list(z0=z.round[2])), adj = c(-.1,2.5), cex = .8)
text(par()$usr[1],par()$usr[4],substitute(paste("c : ", sqrt(z[1]^2+z[2]^2)==sqrt(z0)), list(z0=round(sum(z^2),2))), adj = c(-.06,3.2), cex = .8)


#text(0,z[2]/2,substitute(z[2]==z0, list(z0=z.round[2])), adj = c(-.1,.5), cex = .8)



#points(z[1],par()$usr[3],pch=23,xpd=TRUE,bg="red",col="black")
#points(par()$usr[1],z[2],pch=23,xpd=TRUE,bg="red",col="black")




mtext("A",3,-2,adj=.95,cex=2)


curve(dchisq(x, 2), 0, 10, 300, axes=FALSE, ylab = "Density", 
      xlab = "(squared) Distance from theoretical (se)", yaxs = "i", xaxs="i", lwd = 2, ylim = c(0,1))
segments(par()$usr[1],0,par()$usr[2], 0, xpd=TRUE, col = "gray")
segments(0,0,0,par()$usr[4], xpd=TRUE, col = "gray")

xx = seq(qchisq(.25,2),qchisq(.75,2), len = 300)

polygon(c(xx,rev(xx)), c(dchisq(xx,2),0*xx), col = rgb(0,0,0,.3), border = NA, xpd = TRUE)
abline(v = sum(z^2), lty = 2, lwd = 2, col = "red")
text(sum(z^2), par()$usr[4], substitute(paste(z[1]^2+z[2]^2)==z0,list(z0 = round(sum(z^2),2))),
     adj=c(1.1,1.1), srt = 90)
axis(1)
points(2,0,pch=25,xpd=TRUE,bg="black",col="black")
mtext("B",3,-2,adj=.95,cex=2)

