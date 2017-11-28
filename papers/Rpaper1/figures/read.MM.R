MM = scan('data/MM_data_1887_data.txt')

dim(MM) = c(17, 14)
MM = t(MM)

colnames(MM) = paste(c(16, 1:16), ".", sep = "")

noon = MM[1:7, ]
evening = MM[1:7 + 7, ]

rownames(noon) = c("July 8", "July 9", "July 11", "Mean", "Mean in w.l.","", "Final mean")
rownames(evening) = c("July 8", "July 9", "July 12", "Mean", "Mean in w.l.","", "Final mean")

rm("MM")
