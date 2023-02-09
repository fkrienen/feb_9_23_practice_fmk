version 1.0
workflow SamtoolsMetrics {
  input {
    File inputBam
  }
  call CountBAM {
    input:
      BAM_FILE = inputBAM
  }
  output {
    File final_output = CountBAM.Count_output
  }
}

task CountBAM  {
  input {
    File BAM_FILE
  }
  command <<<
    samtools index ~{BAM_FILE}
    samtools idxstats ~{BAM_FILE} > counts.txt
  >>>
  output {
    File Count_output = "counts.txt"
  }
  runtime {
    docker: 'ekiernan/wdl-101:v1'
  }
}
