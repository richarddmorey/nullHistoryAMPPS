source('data/read.edwards.R',chdir = TRUE)

X2s = tapply(z^2, dat$categ, sum)
dfs = tapply(z^2, dat$categ, length)

ord = order(X2s/dfs, decreasing = TRUE)
X2s = X2s[ord]
dfs = dfs[ord]

M = length(X2s)


plot(0,0,ty='n', ylim = c(0,M), xlim = c(0,4), xaxs = 'i', yaxs = 'i', axes=FALSE,
     ylab="Experiment series (Edwards, 1986)",
     xlab = "Average squared distance from theoretical (se)")
xx = seq(0, 4, len = 500)

for(i in 1:M){
  k = dfs[i]
  x2 = X2s[i]
  x2_mode = max(k-2,0)/k
  x2_max = dchisq(x2_mode*k, k)*k * 1.1

  lines(xx, dchisq(xx*dfs[i], dfs[i])*dfs[i]/x2_max + (i-1), col = "black", lwd=2, xpd = TRUE)

  xx0 = seq(qchisq(.25, k)/k, qchisq(.75, k)/k, len = 250)
  polygon(c(xx0, rev(xx0)), c(dchisq(xx0*k, k)*k/x2_max + (i-1), xx0*0 + (i-1)), border = NA, col=rgb(0,0,0,.3))
  segments(x2/k,i-1,x2/k,i, col="red", lwd=2,lty=2)
  #points(x2/k, (i - 1) + .5, col="red", pch = 19 )
  points(1,0,pch=17,xpd = TRUE)
  text(par()$usr[2],(i-1)+.2, paste("df =",k), adj= c(1.1,-.1), xpd = TRUE)
  text(0,(i-1)+.5, order(ord)[i], adj=c(.5,-.5) ,xpd=TRUE,srt=90)
}
abline(h = 0:(M-1), col=rgb(0,0,0,.2))
segments(0,0,0,M,col=rgb(0,0,0,.2))
axis(1, at = 1, lab = "Expected")
