## samtools sam to bam
p1 <- InputParam(id = "sam", type = "File")
o1 <- OutputParam(id = "bam", type = "File", glob = "$(inputs.sam.basename).bam")
##req1 <- list(class = "InlineJavascriptRequirement") 
sam2bam <- cwlParam(baseCommand = c("samtools", "view"),
                    arguments = list("-b"),
                    inputs = InputParamList(p1),
                    outputs = OutputParamList(o1),
                    stdout = "$(inputs.sam.basename).bam")
