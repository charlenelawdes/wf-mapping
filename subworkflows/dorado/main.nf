process basecall {
    publishDir "${params.out_dir}", mode : "copy"
    label "dorado"

    input:
    path pod5
    path ref
    val model

    output:
    path "${params.sample_id}.bam"

    script:
    def mod = params.no_mod ? "" : (params.m_bases_path ? "--modified-bases-models ${params.m_bases_path}" : "--modified-bases ${params.m_bases}")
    def dev = params.dorado_cpu ? '-x "cpu"' : ""
    def b = params.b ? "-b $params.b" : ""
    """
    dorado duplex $b $dev $model $mod --mm2-preset --reference $ref --min-qscore 10 $pod5 > ${params.sample_id}.bam
    """
}

