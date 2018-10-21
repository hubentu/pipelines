## picard markdup
p1 <- InputParam(id = "ibam", type = "File", prefix = "I=", separate = FALSE)
p2 <- InputParam(id = "obam", type = "string", prefix = "O=", separate = FALSE,
                 default = sub(".bam", ".mdup.bam", bamfile))
p3 <- InputParam(id = "matrix", type = "string", prefix = "M=", separate = FALSE,
                 default = sub(".bam", ".mdup.txt", bamfile))
o1 <- OutputParam(id = "mBam", type = "File", glob = "$(inputs.obam)")
o2 <- OutputParam(id = "Mat", type = "File", glob = "$(inputs.matrix)")
markdup <- cwlParam(baseCommand = c("java", "-jar",
                                    "/home/qhu/bin/picard.jar",
                                    "MarkDuplicates"),
                    inputs = InputParamList(p1, p2, p3),
                    outputs = OutputParamList(o1, o2))
