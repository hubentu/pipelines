## Pipeline: fastQC + STAR + featureCounts
## Note: output to current dir
p1 <- InputParam(id = "cwl_genomeDir", type = "Directory")
p2 <- InputParam(id = "cwl_sjdbGTFfile", type = "File")
p3 <- InputParam(id = "cwl_seqfiles", type = "File[]")
o1 <- OutputParam(id = "cwl_fastqc", type = "File[]", outputSource = "fastqc/QCfile")
o2 <- OutputParam(id = "cwl_outBAM", type = "File", outputSource = "STAR/outBAM")
o3 <- OutputParam(id = "cwl_count", type = "File", outputSource = "fcount/count")

req1 <- list(class = "ScatterFeatureRequirement")
rnaseq_Sf <- cwlStepParam(requirements = list(req1),
                       inputs = InputParamList(p1, p2, p3),
                       outputs = OutputParamList(o1, o2, o3))

## fastqc
s1 <- Step(id = "fastqc", run = fastqc,
           In = list(seqfile = "cwl_seqfiles"),
           scatter = "seqfile")
## STAR
s2 <- Step(id = "STAR", run = STAR,
           In = list(genomeDir = "cwl_genomeDir",
                     sjdbGTFfile = "cwl_sjdbGTFfile",
                     readFilesIn = "cwl_seqfiles"))
## samtools
s3 <- Step(id = "s_index", run = samtools_index,
           In = list(bam = "STAR/outBAM"))
s4 <- Step(id = "s_flagstat", run = samtools_flagstat,
           In = list(bam = "STAR/outBAM"))
## featureCounts
s5 <- Step(id = "fcount", run = featureCounts,
           In = list(gtf = "cwl_sjdbGTFfile",
                     bam = "STAR/outBAM"))
## pipeline
rnaseq_Sf <- rnaseq_Sf + s1 + s2 + s3 + s4 + s5
