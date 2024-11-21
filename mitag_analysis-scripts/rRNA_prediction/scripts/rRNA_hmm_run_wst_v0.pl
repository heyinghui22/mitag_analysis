#!/usr/bin/perl
## ==============================================================================
## Automated annotation tools
##
## program written by
##                                      Weizhong Li, UCSD
##                                      liwz@sdsc.edu
##                                      http://weizhong-lab.ucsd.edu
## ==============================================================================

my $script_name = $0;
my $script_dir = $0;
   $script_dir =~ s/[^\/]+$//;
   $script_dir = "." unless ($script_dir);
require "$script_dir/ann_local.pl";

my $cpu_cores = shift;
my $seq_dir = shift;
my $output_dir = shift;
my $input_suffix = shift;


#my $bl_exe = "$script_dir/../rRNA_hmm_fs_wst_v0/rna_hmm3.py -L $script_dir/../rRNA_hmm_fs_wst_v0/HMM3/ -m ssu,lsu,tsu";
my $bl_exe = "$script_dir/../rRNA_hmm_fs_wst_v0/rna_hmm3.py -L $script_dir/../rRNA_hmm_fs_wst_v0/HMM3/ -m ssu,lsu,tsu --cpu $cpu_cores "; 
my ($i, $j, $k, $cmd);
print "$bl_exe";

LL_random_sleep(10);
my @seqs = LL_get_active_ids($seq_dir); LL_shuffle_array(\@seqs);
$cmd = `mkdir $output_dir` unless (-e $output_dir);


LL_random_sleep(10);
foreach $i (@seqs) {do_this_seq_bl2($i); }

my ($tu,$ts,$cu,$cs)=times(); my $tt=$tu+$ts+$cu+$cs;
$cmd = `echo $output_dir $tt >> log.cpu`;

sub do_this_seq_bl2 {
  my $id = shift;

  LL_random_sleep(1);
  if ($input_suffix) {
    next unless ($id =~ /\.$input_suffix$/);
  }

  my $cmd;
  my $tout = "$output_dir/$id";
  if ($input_suffix) { $tout =~ s/\.$input_suffix$//; }

  return if (-e "$tout.coord");        # output file exist
  return if (-s "$tout.gz");
  return if (-e "$tout.lock"); # being calculated by another parallelly
  $cmd = `date > $tout.lock`;
  my $bl_cmd = "$bl_exe -i $seq_dir/$id -o $tout";
  print STDERR "$bl_cmd\n\n";
  $cmd = `$bl_cmd`;
  $cmd = `rm -f $tout.lock`;
}
print "$bl_cmd";
