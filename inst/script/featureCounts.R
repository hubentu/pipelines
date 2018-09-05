## featureCounts
## Note: output to current directory
f1 <- InputParam(id = "gtf", type = "File", prefix = "-a")
f2 <- InputParam(id = "bam", type = "File")
o1 <- OutputParam(id = "count", type = "File", glob = "*.txt")
featureCounts <- cwlParam(baseCommand = "featureCounts",
                          arguments = list("-o", "./featureCounts.txt"),
                          inputs = InputParamList(f1, f2),
                          outputs = OutputParamList(o1))

