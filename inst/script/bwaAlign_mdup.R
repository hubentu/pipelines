## params
p1 <- InputParam(id = "threads", type = "int")
p2 <- InputParam(id = "RG", type = "string")
p3 <- InputParam(id = "Ref", type = "string")
p4 <- InputParam(id = "FQs", type = "File[]")
p5 <- InputParam(id = "mbam", type = "string")
p6 <- InputParam(id = "Matrix", type = "string", default = "bwaOutput.sam.sorted.mdup.txt")

o1 <- OutputParam(id = "mBam", type = "File", outputSource = "markdup/mBam")
o2 <- OutputParam(id = "Mat", type = "File", outputSource = "markdup/Mat")

## stepParam
bwaAlignMdup <- cwlStepParam(inputs = InputParamList(p1, p2, p3, p4, p5, p6),
                             outputs = OutputParamList(o1, o2))
## bwa
s1 <- Step(id = "bwa", run = bwa,
           In = list(threads = "threads",
                     RG = "RG",
                     Ref = "Ref",
                     FQs = "FQs"))

## sam to bam
s2 <- Step(id = "sam2bam", run = sam2bam,
           In = list(sam = "bwa/sam"))

## sort bam
s3 <- Step(id = "sortBam", run = sortBam,
           In = list(bam = "sam2bam/bam"))

## markdup
s4 <- Step(id = "markdup", run = markdup,
           In = list(ibam = "sortBam/sbam",
                     obam = "mbam",
                     matrix = "Matrix"))

## pipeline
bwaAlignMdup <- bwaAlignMdup + s1 + s2 + s3 + s4
