dat = read.table('mendel_edwards_1986.txt', stringsAsFactors = FALSE, header = TRUE)

num.ratio = sapply(strsplit(dat$expected,":"),function(el){
  as.numeric(el[1])/as.numeric(el[2])
})
exp.p =  num.ratio / (1 + num.ratio)
se.p = sqrt(exp.p * (1 - exp.p)/dat$total)
obs.p = dat$obs1 / dat$total
z = (obs.p - exp.p) / se.p
dat$ocr_dev = abs(z - dat$X)

# check sums
all(dat$obs1 + dat$obs2 == dat$total)

# check X stats
# plot(dat$X, z)
# abline(0,1)
max(dat$ocr_dev)

# Final X^2
X2 = sum(dat$X^2)

# Final p
1 - pchisq(X2, nrow(dat))




