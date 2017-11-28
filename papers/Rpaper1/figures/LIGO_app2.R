

LIGO_app1 = png::readPNG(source = "img/LIGO_location.png")

m = par()$mar
par(mfrow = c(1,1), mar = m + c(3,5,3,5))

plot(1:2, type='n', axes=FALSE, ylab = "", xlab = "")
rasterImage(LIGO_app1,xleft = par()$usr[1], xright = par()$usr[2], ybottom = par()$usr[3], ytop = par()$usr[4], angle = 0)
#mtext("A", 3, 0, adj = .05, cex = 2)

