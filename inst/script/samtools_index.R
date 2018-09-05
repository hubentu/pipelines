## Index bam
p1 <- InputParam(id = "bam", type = "File")
o1 <- OutputParam(id = "idx", type = "File", glob = "$(inputs.bam.basename)", secondaryFiles = ".bai")
req1 <- list(class = "InitialWorkDirRequirement",
             listing = list("$(inputs.bam)"))
samtools_index <- cwlParam(baseCommand = c("samtools", "index"),
                           requirements = list(req1),
                           inputs = InputParamList(p1),
                           outputs = OutputParamList(o1))
