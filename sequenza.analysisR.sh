#!/path/tp/Rscript

library("sequenza")

sname <- "mySampleName"
sampleDir <- "path/to/seqzfile/sample.seqz.gz"
outDir <- "myoutputdirectory"

extractData <- sequenza.extract(sampleDir,window = 10e5,min.reads=50,min.reads.normal=20)
extractData.CP <- sequenza.fit(extractData,segment.filter = 5e6)
sequenza.results(extractData, extractData.CP, out.dir = outDir,sample.id = sname)
