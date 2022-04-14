### R code from vignette source 'missForest_1.5.Rnw'

###################################################
### code chunk number 1: setRopts
###################################################
require(foreach)
require(missForest)
options(width=70, prompt="> ", continue="+ ")
options(SweaveHooks=list(fig=function() par(mar=c(4,4,0.4,0.7)))) 


###################################################
### code chunk number 2: missForest_1.5.Rnw:85-86 (eval = FALSE)
###################################################
## install.packages(missForest, dependencies = TRUE)


###################################################
### code chunk number 3: missForest_1.5.Rnw:120-121 (eval = FALSE)
###################################################
## library(missForest)


###################################################
### code chunk number 4: missForest_1.5.Rnw:127-128
###################################################
set.seed(81)


###################################################
### code chunk number 5: iris.mis
###################################################
data(iris)
iris.mis <- prodNA(iris, noNA = 0.1)
summary(iris.mis)


###################################################
### code chunk number 6: missForest_1.5.Rnw:142-143
###################################################
set.seed(81)


###################################################
### code chunk number 7: iris.imp
###################################################
iris.imp <- missForest(iris.mis)


###################################################
### code chunk number 8: irisOOBerr
###################################################
iris.imp$OOBerror


###################################################
### code chunk number 9: irisOOBvarwise
###################################################
iris.imp <- missForest(iris.mis, variablewise = TRUE)
iris.imp$OOBerror


###################################################
### code chunk number 10: iris.imp.verb
###################################################
set.seed(81)
iris.imp <- missForest(iris.mis, verbose = TRUE)


###################################################
### code chunk number 11: missForest_1.5.Rnw:234-235
###################################################
iris.imp$OOBerror


###################################################
### code chunk number 12: missForest_1.5.Rnw:259-260
###################################################
set.seed(84)


###################################################
### code chunk number 13: esophExample
###################################################
data(esoph)
esoph.mis <- prodNA(esoph, 0.05)
set.seed(96)
esoph.imp <- missForest(esoph.mis, verbose = TRUE)


###################################################
### code chunk number 14: maxiterEsoph
###################################################
set.seed(96)
esoph.imp <- missForest(esoph.mis, verbose = TRUE, maxiter = 6)


###################################################
### code chunk number 15: muskData
###################################################
X <- scan('http://stat.ethz.ch/Teaching/Datasets/musk.dat', what = 'character', sep =',')
X <- matrix(X, ncol = 169, byrow=TRUE)
rowlabels <- X[,1]
X <- X[,-c(1,2)] #remove molecule names and conformations
X <- X[,-167] #remove response
musk <- matrix(as.numeric(X), ncol = 166)


###################################################
### code chunk number 16: muskBigNtree (eval = FALSE)
###################################################
## musk.mis <- prodNA(musk, 0.05)
## musk.imp <- missForest(musk.mis, verbose = TRUE, maxiter = 3)


###################################################
### code chunk number 17: muskSmallNtree (eval = FALSE)
###################################################
## musk.imp <- missForest(musk.mis, verbose = TRUE, maxiter = 3, ntree = 20)


###################################################
### code chunk number 18: subsampling
###################################################
set.seed(81)
iris.imp.sub <- missForest(iris.mis, verbose = TRUE, replace = FALSE)
iris.imp.sub$OOBerror


###################################################
### code chunk number 19: sampsize (eval = FALSE)
###################################################
## iris.sampsize <- list(12, 12, 12, 12, c(10, 15, 10))
## iris.imp.sampsize <- missForest(iris.mis, sampsize = iris.sampsize)


###################################################
### code chunk number 20: cutoff (eval = FALSE)
###################################################
## iris.cutoff <- list(1, 1, 1, 1, c(0.3, 0.6, 0.1))
## iris.imp.cutoff <- missForest(iris.mis, cutoff = iris.cutoff)


###################################################
### code chunk number 21: classwt (eval = FALSE)
###################################################
## iris.classwt <- list(NULL, NULL, NULL, NULL, c(10, 30, 20))
## iris.imp.classwt <- missForest(iris.mis, classwt = iris.classwt)


###################################################
### code chunk number 22: terminal (eval = FALSE)
###################################################
## iris.imp.term <- missForest(iris.mis, nodesize = c(3, 7))


###################################################
### code chunk number 23: irisStrategy (eval = FALSE)
###################################################
## iris.mis <- prodNA(iris, noNA = 0.1)
## iris.imp <- missForest(iris.mis)


###################################################
### code chunk number 24: irisStrategy2
###################################################
iris.err <- mixError(iris.imp$ximp, iris.mis, iris)
print(iris.err)


###################################################
### code chunk number 25: irisError (eval = FALSE)
###################################################
## iris.err <- mixError(iris.imp, iris.mis, iris)


###################################################
### code chunk number 26: missForest_1.5.Rnw:535-536
###################################################
set.seed(81)


###################################################
### code chunk number 27: irisPerfom
###################################################
iris.imp <- missForest(iris.mis, xtrue = iris, verbose = TRUE)


###################################################
### code chunk number 28: errorDirect
###################################################
iris.imp$error


###################################################
### code chunk number 29: doParallel
###################################################
require(doParallel)
registerDoParallel(cores=2)
getDoParWorkers()
require(doRNG)
registerDoRNG(seed = 1.618)
foreach(i=1:3) %dorng% sqrt(i)


