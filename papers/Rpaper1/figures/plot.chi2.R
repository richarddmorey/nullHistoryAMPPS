plot(0,0,ty='n',ylim = c(0,1.2), xlim=c(0,10), xaxs='i',yaxs='i',
     main = expression(paste(chi^2,"(1) distribution",sep="")),
     ylab = "Density", xlab="Squared deviation from expectation", axes=FALSE)

xx = seq(qchisq(.025,1), qchisq(.975,1), len = 200)
polygon(c(xx,rev(xx)), c(dchisq(xx,1), xx*0), border = NA, col="gray")

curve( dchisq(x, df=1), 0, 10, add=TRUE, lwd=2)
axis(1)
box()

abline(v = 0.263, col = "red")


