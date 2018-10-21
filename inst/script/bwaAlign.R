## params
p1 <- InputParam(id = "threads", type = "int")
p2 <- InputParam(id = "RG", type = "string")
p3 <- InputParam(id = "Ref", type = "string")
p4 <- InputParam(id = "FQs", type = "File[]")

o1 <- OutputParam(id = "Bam", type = "File", outputSource = "sortBam/sbam")

## stepParam
bwaAlign <- cwlStepParam(inputs = InputParamList(p1, p2, p3, p4),
                         outputs = OutputParamList(o1))
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

## pipeline
bwaAlign <- bwaAlign + s1 + s2 + s3
