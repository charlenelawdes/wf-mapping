process pod5_channel {
    label "pod5_sm"
    
    input:
    path pod5

    
    output:
    path "pod5summary.tsv"

    script:
    """
    pod5 view $pod5 --include "read_id, channel" --output pod5summary.tsv
    """
}

process pod5_subset {
    label "pod5_b"

    input:
    path pod5
    path tsv
    
    output:
    path "split_by_channel"

    script:
    """
    pod5 subset $pod5 --summary $tsv --columns channel --output split_by_channel
    """
}