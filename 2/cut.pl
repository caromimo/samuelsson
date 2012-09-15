# very simple cutter

%enzymes = (
    'BclI'    => 'TGATCA',
    'BfmI'    => 'CTRYAG',
    'Cac8I'   => 'GCNNGC',
    'EcoRI'   => 'GAATTC',
    'HindIII' => 'AAGCTT'
);

%enzymes_mod = %enzymes;

# modify the ambiguity letters

%amb = (
    'R' => '[AG]',
    'Y' => '[CT]',
    'N' => '[AGCT]',
    'W' => '[AT]',
    'M' => '[AC]',
    'S' => '[CG]',
    'K' => '[TG]',
    'V' => '[ACG]',
    'H' => '[ACT]',
    'D' => '[AGT]',
    'B' => '[CGT]'
);

foreach $val ( values %enzymes_mod ) {
    foreach $key ( keys %amb ) {
        $val =~ s/$key/$amb{$key }/g;
    }
}

$seq = 'GATCTGACTAGCGAGCGTGATCAAGCTTGTGTAGGAATTCCTTGATGCTGTAGCGCGAGC';

for ( $i = 0 ; $i < length($seq) - 5 ; $i++ ) {

    $testseq = substr( $seq, $i, 6 );

    foreach $key ( keys %enzymes_mod ) {
        if ( $testseq =~ /$enzymes_mod{$key}/ ) {
            $pos = $i + 1;
            print "$key\t$pos\t$testseq\t$enzymes{$key}\n";
        }
    }
}
