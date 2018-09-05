## fastqc
f1 <- InputParam(id = "seqfile", type = "File")
o1 <- OutputParam(id = "QCfile", type = "File", glob = "*.zip")

fastqc <- cwlParam(baseCommand = "fastqc",
                   arguments = list("--outdir", "./"),
                   inputs = InputParamList(f1),
                   outputs = OutputParamList(o1))

