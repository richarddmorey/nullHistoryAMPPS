



MM_app1 = png::readPNG(source = "img/MM_fig3.png")
MM_app2 = png::readPNG(source = "img/MM_fig4.png")


m = par()$mar
par(mfrow = c(1,2), mar = m + c(6,-4,0,0))

plot(1:2, type='n', axes=FALSE, ylab = "", xlab = "")
rasterImage(MM_app1,xleft = par()$usr[1], xright = par()$usr[2], ybottom = par()$usr[3], ytop = par()$usr[4], angle = 0)
mtext("A", 3, 0, adj = .05, cex = 2)


par(mar = m + c(0,-4,0,-1))

plot(1:2, type='n', axes=FALSE, ylab = "", xlab = "")
rasterImage(MM_app2, xleft = par()$usr[1], xright = par()$usr[2], ybottom = par()$usr[3], ytop = par()$usr[4], angle = 0)
rect(par()$usr[1],par()$usr[4],par()$usr[2],par()$usr[4]-.03, border=NA, col = "white")
mtext("B", 3, 0, adj = .05, cex = 2)
