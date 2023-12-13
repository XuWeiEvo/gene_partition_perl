#!/usr/bin/perl

use strict;
use warnings;

my $input_file = 'input.csv';
my $output_file = 'partition.txt';

open(my $input_fh, '<', $input_file) or die "Cannot open input file: $!";
open(my $output_fh, '>', $output_file) or die "Cannot open output file: $!";

while (my $line = <$input_fh>) {
    chomp $line;
    my ($filename, $range) = split(',', $line);
    my ($gene) = $filename =~ /^(.*?)_/;  ##my ($gene) = $filename =~ /^([A-Za-z0-9_,]+)/;

    my ($start, $end);
    my ($codon_start, $codon_end, $length);

    if ($gene =~ /^(12s|16s)$/) {
        ($start, $end) = $range =~ /(\d+) => (\d+)/;
        print $output_fh "DNA, $gene = $start-$end\n";
    } else {
        ($start, $end) = $range =~ /(\d+) => (\d+)/;
        $length = $end - $start + 1;

        for my $i (1..3) {
            $codon_start = $start + ($i - 1);
            $codon_end = $end;
            print $output_fh "DNA, ${gene}_codon$i = $codon_start-$codon_end\\3\n";
        }
    }
}


close $input_fh;
close $output_fh;

print "Conversion completed. Results saved in partition.txt.\n";







## If you do not want to split the three codon, then use the code below:

#!/usr/bin/perl

use strict;
use warnings;

my $input_file = 'input.csv';
my $output_file = 'partition.txt';

open(my $input_fh, '<', $input_file) or die "Cannot open input file: $!";
open(my $output_fh, '>', $output_file) or die "Cannot open output file: $!";

while (my $line = <$input_fh>) {
    chomp $line;
    my ($filename, $range) = split(',', $line);
    my ($gene) = $filename =~ /^([A-Za-z0-9_,]+)/;

    my ($start, $end);


        ($start, $end) = $range =~ /(\d+) => (\d+)/;
        print $output_fh "DNA, $gene = $start-$end\n";
     
}

close $input_fh;
close $output_fh;

print "Conversion completed. Results saved in partition.txt.\n";

