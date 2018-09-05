## STAR
## Note: output to current dir
p1 <- InputParam(id = "genomeDir", type = "Directory", prefix = "--genomeDir")
p2 <- InputParam(id = "sjdbGTFfile", type = "File", prefix = "--sjdbGTFfile")
p3 <- InputParam(id = "readFilesIn", type = "File[]", prefix = "--readFilesIn")

o1 <- OutputParam(id = "outBAM", type = "File", glob = "*.bam")

STAR <- cwlParam(baseCommand = "STAR",
                 arguments = list("--outFileNamePrefix", "./",
                                  "--outFilterMultimapNmax", "3",
                                  "--outSAMunmapped", "Within",
                                  "--outFilterMismatchNmax", "2",
                                  "--runThreadN", "6",
                                  "--outSAMstrandField", "intronMotif",
                                  "--readFilesCommand", "zcat",
                                  "--outSAMtype", "BAM", "SortedByCoordinate",
                                  "--twopassMode", "Basic",
                                  "--quantMode", "GeneCounts"),
                 inputs = InputParamList(p1, p2, p3),
                 outputs = OutputParamList(o1))
