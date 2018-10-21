## bwa mem
p1 <- InputParam(id = "threads", type = "int", prefix = "-t", position = 1)
p2 <- InputParam(id = "RG", type = "string", prefix = "-R", position = 2)
p3 <- InputParam(id = "Ref", type = "string", position = 3)
p4 <- InputParam(id = "FQs", type = "File[]", position = 4)
o1 <- OutputParam(id = "sam", type = "File", glob = "*.sam")
bwa <- cwlParam(baseCommand = c("bwa", "mem"),
                inputs = InputParamList(p1, p2, p3, p4),
                output = OutputParamList(o1),
                stdout = "bwaOutput.sam")
