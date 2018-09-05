## Index bam
## Note: result will be generated to current dir.
p1 <- InputParam(id = "bam", type = "File")
o1 <- OutputParam(id = "flagstat", type = "File", glob = "$(inputs.bam.basename).flagstat.txt")
samtools_flagstat <- cwlParam(baseCommand = c("samtools", "flagstat"),
                              inputs = InputParamList(p1),
                              outputs = OutputParamList(o1),
                              stdout = "$(inputs.bam.basename).flagstat.txt")
