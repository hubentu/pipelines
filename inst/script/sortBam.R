## samtools sort bam
p1 <- InputParam(id = "bam", type = "File")
o1 <- OutputParam(id = "sbam", type = "File", glob = "$((inputs.bam.basename).replace('.bam', '')).sorted.bam")
req1 <- list(class = "InlineJavascriptRequirement") 
sortBam <- cwlParam(baseCommand = c("samtools", "sort"),
                    requirements = list(req1),
                    inputs = InputParamList(p1),
                    outputs = OutputParamList(o1),
                    stdout = "$((inputs.bam.basename).replace('.bam', '')).sorted.bam")
