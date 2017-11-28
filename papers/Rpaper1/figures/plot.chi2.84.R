source('data/read.edwards.R',chdir = TRUE)

obs.X2 = sum(dat$X^2)


plot(0,0,ty='n',ylim = c(0,0.04), xlim=c(20,140), xaxs='i',yaxs='i',
     ylab = "Density", xlab="Squared distance from theoretical (se)", axes=FALSE)

xx = seq(qchisq(.25,84), qchisq(.75,84), len = 200)
polygon(c(xx,rev(xx)), c(dchisq(xx,84), xx*0), border = NA, col="gray")

curve( dchisq(x, df=84), par()$usr[1], par()$usr[2],  300, add=TRUE, lwd=2)
axis(1)
#box()

abline(v = obs.X2, col = "red", lty= 2, lwd = 2)
text(obs.X2, par()$usr[4], substitute(paste("Total squared distance",phantom()==z0),list(z0 = round(obs.X2,2))),
     adj=c(1.1,1.1), srt = 90)
points(84,0,pch=25,xpd=TRUE,bg="black",col="black")

#1-pchisq(obs.X2,84)

