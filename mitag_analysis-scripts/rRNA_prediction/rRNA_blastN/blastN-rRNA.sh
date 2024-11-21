#! /bin/bash

#$ -cwd
#$ -j n
#$ -r y
#$ -hard
# -m e
#$ -M gaozm@ust.hk
#$ -S /bin/bash
#$ -N blast-silva


source ~/.bashrc
blastall -i ../data/input.3/LF10001_EGTs.fa -d ~/bio/Silva_SSU/SSURef_108_NR_tax_silva_trunc_v2.fasta -o LF_EGTs.rRNA.out -v 1  -b 1  -e 1e-04 -p blastn -a 8 -m 8;


#blastall -i ../data/input.1/1_clean.fna -d ~/bio/Silva_SSU/SSURef_108_NR_tax_silva_trunc_v2.fasta -o 1_clean.rRNA.out -v 1  -b 1  -e 1e-04 -p blastn -a 8 -m 8;
#blastall -i ../data/input.1/2_clean.fna -d ~/bio/Silva_SSU/SSURef_108_NR_tax_silva_trunc_v2.fasta -o 2_clean.rRNA.out -v 1  -b 1  -e 1e-04 -p blastn -a 8 -m 8;

#/home/gaozm/metagenome/SQD_1.1/FastqToFasta.pl -i ~/metagenome/SQD_1.1/LF10001_clean_1.fq -o 1_clean.fna;
#/home/gaozm/metagenome/SQD_1.1/FastqToFasta.pl -i ~/metagenome/SQD_1.1/LF10001_clean_2.fq -o 2_clean.fna;

#blastall -i output.2/1_clean.fna.seq.seq -d ~/bio/Silva_SSU/SSURef_108_NR_tax_silva_trunc_v2.fasta -o 1_clean.m8.out -v 1  -b 1  -e 1e-04 -p blastn -a 8 -m 8;
#blastall -i output.2/1_clean.fna.seq.seq -d ~/bio/Silva_SSU/SSURef_108_NR_tax_silva_trunc_v2.fasta -o 1_clean.m7.out -v 10 -b 10 -e 1e-04 -p blastn -a 8 -m 7;
#blastall -i output.2/2_clean.fna.seq.seq -d ~/bio/Silva_SSU/SSURef_108_NR_tax_silva_trunc_v2.fasta -o 2_clean.m8.out -v 1  -b 1  -e 1e-04 -p blastn -a 8 -m 8;
#blastall -i output.2/2_clean.fna.seq.seq -d ~/bio/Silva_SSU/SSURef_108_NR_tax_silva_trunc_v2.fasta -o 2_clean.m7.out -v 10 -b 10 -e 1e-04 -p blastn -a 8 -m 7;


#export PATH=/home/gaozm/packages/rRNA_prediction/rRNA_hmm_fs_wst_v0:$PATH;
#../scripts/rRNA_hmm_run_wst_v0.pl  input.2 output.2;

#export BLASTDB=/share/apps/ncbi/db/nr_201206/
#export BLASTMAT=/opt/bio/ncbi/data/
#export Data=/opt/bio/ncbi/data/

#perl DL.pl LF10001_raw_1.fa.trimmed
#perl ../packages/solexaQA/SolexaQA.pl cosmids_read_1.fq -d CO/
#compare_alpha_diversity.py -i ./alpha_div/alpha_rare_silva108_c80_97/bacteria/alpha_div_collated/shannon.txt -m map_1d_factors.txt -c Site -d 16610 -o ./shannon_d16610.txt
#pick_rep_set.py -i picked_otus/denoised_seqs_otus.txt -f ../denoised_seqs/denoised_seqs.fna -m most_abundant -o ./mothur_otus_97_rep_set.fasta -l ./pick_rep_set.log
#assign_taxonomy.py -i mothur_otus_97_rep_set.fasta -o ./rdp_taxa_silva108_c80 --rdp_max_memory 8192
#assign_taxonomy.py -i /home/salim/red_sea/cruise_2010/16S_pyrosequencing/mothur_pick_otus_97/mothur_otus_97_rep_set.fasta -o /home/salim/red_sea/cruise_2010/16S_pyrosequencing/mothur_pick_otus_97/rdp_taxa_silva108_c80_species/ -c 0.8 -t /home/salim/packages/Silva/Silva_108/taxa_mapping/Silva_RDP_taxa_mapping_species.txt -r /home/salim/packages/Silva/Silva_108/rep_set/Silva_108_rep_set.fna --rdp_max_memory 8192
#filter_alignment.py -i pynast_aligned_gg/mothur_otus_97_rep_set_aligned.fasta
#align_seqs.py -i mothur_otus_97_rep_set.fasta -m muscle --muscle_max_memory 8192 -o ./muscle_aligned
#make_phylogeny.py -i mothur_otus_97_rep_set_clustalw_aligned_trimal_nonchimeric.fasta -o mothur_otus_97_rep_set_clustalw_aligned_trimal_nonchimeric.tree
#make_phylogeny.py -i mothur_otus_97_rep_set_GGaligned_pfiltered_nonchimeric.fasta -o mothur_otus_97_rep_set_GGaligned_pfiltered_nonchimeric.tree
#make_phylogeny.py -i mothur_otus_97_rep_set_silva108aligned_pfiltered_nonchimeric.fasta -o mothur_otus_97_rep_set_silva108aligned_pfiltered_nonchimeric.tree
#make_otu_table.py -i picked_otus/denoised_seqs_otus.txt -t rdp_taxa_silva108_c80/mothur_otus_97_rep_set_tax_assignments.txt -e mothur_otus_97_rep_set_aligned_chimeric.txt -o otu_table_silva108_c80.txt
#make_otu_table.py -i picked_otus/denoised_seqs_otus.txt -t rdp_taxa_gg_c80/mothur_otus_97_rep_set_tax_assignments.txt -e mothur_otus_97_rep_set_aligned_chimeric.txt -o otu_table_gg_c80.txt
#summarize_taxa_through_plots.py -i blast_taxa_silva108_c80/otu_table_silva108_species.txt -o taxa_summary_silva108_blast -m /home/salim/red_sea/cruise_2010/16S_pyrosequencing/map_redsea2010_16S_1d_factors02.txt -c SampleID -p ../sum_taxat_paras.txt -f
#summarize_taxa_through_plots.py -i split_otus/Root-k__Archaea_otu_table_silva108_c80.txt -o taxa_summary_silva108_c80/archaea -m /home/salim/red_sea/cruise_2010/16S_pyrosequencing/map_redsea2010_16S_1d_factors02.txt -c SampleID -p ../sum_taxat_paras.txt -f
#summarize_taxa_through_plots.py -i otu_table_gg_c80.txt -o taxa_summary_gg_c80/all -m /home/salim/red_sea/cruise_2010/16S_pyrosequencing/map_redsea2010_16S_1d_factors02.txt -c SampleID -p ../sum_taxat_paras.txt
#make_otu_network.py -m ../map_1d_factors.txt -i otu_table_silva108_c80.txt
#nmds.py -i beta_div/bacteria_silva108_c80/weighted_unifrac_dm.txt -o beta_div/bacteria_silva108_c80/nmds_weighed_unifrac.txt
#compare_distance_matrices.py -i unifrac_dm.txt,unifrac_g_full_tree_dm.txt,unweighted_unifrac_full_tree_dm.txt,weighted_unifrac_dm.txt,unifrac_g_dm.txt,unweighted_unifrac_dm.txt,weighted_normalized_unifrac_dm.txt -o mantel_out.txt -n 1000

############################################################################################################################
#otu_category_significance.py -i otu_table_silva108_c80_abundant.txt -m ../map_1d_factors.txt -s correlation -f 1 -o otu_sig_corr_fe.txt -c Fe -n Site
#otu_category_significance.py -i otu_table_silva108_c80_abundant.txt -m ../map_1d_factors.txt -s correlation -f 1 -o otu_sig_corr_mn.txt -c Mn -n Site
#otu_category_significance.py -i otu_table_silva108_c80_abundant.txt -m ../map_1d_factors.txt -s correlation -f 1 -o otu_sig_corr_so4.txt -c SO4 -n Site
#otu_category_significance.py -i otu_table_silva108_c80_abundant.txt -m ../map_1d_factors.txt -s correlation -f 1 -o otu_sig_corr_p.txt -c P -n Site
#otu_category_significance.py -i otu_table_silva108_c80_abundant.txt -m ../map_1d_factors.txt -s correlation -f 1 -o otu_sig_corr_no3.txt -c NO3 -n Site
#otu_category_significance.py -i otu_table_silva108_c80_abundant.txt -m ../map_1d_factors.txt -s correlation -f 1 -o otu_sig_corr_toc.txt -c TOC -n Site
#otu_category_significance.py -i otu_table_silva108_c80_abundant.txt -m ../map_1d_factors.txt -s correlation -f 1 -o otu_sig_corr_ic.txt -c IC -n Site
#otu_category_significance.py -i otu_table_silva108_c80_abundant.txt -m ../map_1d_factors.txt -s correlation -f 1 -o otu_sig_corr_nh4.txt -c NH4 -n Site
#otu_category_significance.py -i otu_table_silva108_c80_abundant.txt -m ../map_1d_factors.txt -s correlation -f 1 -o otu_sig_corr2_no2.txt -c NO2 -n Site
#otu_category_significance.py -i otu_table_silva108_c80_abundant.txt -m ../map_1d_factors.txt -s correlation -f 1 -o otu_sig_corr2_temp.txt -c Temp -n Site
#otu_category_significance.py -i otu_table_silva108_c80_abundant.txt -m ../map_1d_factors.txt -s correlation -f 1 -o otu_sig_corr2_salinity.txt -c Salinity -n Site
#otu_category_significance.py -i otu_table_silva108_c80_abundant.txt -m ../map_1d_factors.txt -s correlation -f 1 -o otu_sig_corr2_po4.txt -c P -n Site
#otu_category_significance.py -i otu_table_silva108_c80_abundant.txt -m ../map_1d_factors.txt -s correlation -f 1 -o otu_sig_corr2_cu.txt -c Cu -n Site
#otu_category_significance.py -i otu_table_silva108_c80_abundant.txt -m ../map_1d_factors.txt -s correlation -f 1 -o otu_sig_corr2_cl.txt -c Cl -n Site

#otu_category_significance.py -i otu_table_silva108_c80.txt -m ../map_1d_factors.txt -s ANOVA -f 1 -o otu_sig_anova_site.txt -c Site
#otu_category_significance.py -i otu_table_silva108_c80.txt -m ../map_1d_factors.txt -s ANOVA -f 1 -o otu_sig_anova_type.txt -c Type
############################################################################################################################
#pick_otus.py -i ../denoised_seqs/denoised_seqs.fna -m mothur -c average -o ./ -s 0.97

#pick_otus_through_otu_table.py -i /home/salim/red_sea/cruise_2010/16S_pyrosequencing/split_lib/seqs_all.txt -o /home/salim/red_sea/cruise_2010/16S_pyrosequencing/otus_qiime1.4.0/ -f -p /home/salim/red_sea/cruise_2010/16S_pyrosequencing/otus_qiime1.4.0/qiime_parameters.txt


#split_fasta_on_sample_ids.py -i denoised_seqs_otu_rep_set_97.fasta -o otu_rep_per_sample

#make_otu_heatmap_html.py -i otu_table_gg_c80_95.txt -o ./heatmap_gg/95/ -t denoised_seqs_rep_set_muscle_95_aligned.tre -m map_1d_factors.txt
#make_otu_heatmap_html.py -i otu_table_gg_c80_97.txt -o ./heatmap_gg/97/ -t denoised_seqs_rep_set_muscle_97_aligned.tre -m map_1d_factors.txt
#make_otu_heatmap_html.py -i otu_table_gg_c80_99.txt -o ./heatmap_gg/99/ -t denoised_seqs_rep_set_muscle_99_aligned.tre -m map_1d_factors.txt

#shared_phylotypes.py -i otu_table_silva108_c80_97.txt -o shared_otus/shared_otus_silva108_97.txt

#make_tep.py -i split_otus/L1/97/Root-k__Bacteria_otu_table_silva108_c80_97.txt -m map_1d_factors.txt -t denoised_seqs_rep_set_muscle_97_aligned.tre -o topiarytree_97_bacteria

#otu_category_significance.py -f 5 -i otu_table_silva108_c80_97.txt -m map_1d_factors.txt -n SampleID -c NO3 -s g_test -o NO3_gtest.txt
#otu_category_significance.py -f 5 -i otu_table_silva108_c80_97.txt -m map_1d_factors.txt -n SampleID -c NO3 -s ANOVA -o NO3_anova.txt
#otu_category_significance.py -f 5 -i otu_table_silva108_c80_97.txt -m map_1d_factors.txt -n SampleID -c NO3 -s correlation -o NO3_correlation.txt

#plot_rank_abundance_graph.py -i split_otus/L1/97/Root-k__Bacteria_otu_table_silva108_c80_97.txt  -s '*' -o ./rank_abundance_rela_xy -f png -x -y
#plot_rank_abundance_graph.py -i split_otus/L1/97/Root-k__Bacteria_otu_table_silva108_c80_97.txt  -s '*' -o ./rank_abundance_abs_xy -f png -a -x -y
#plot_rank_abundance_graph.py -i split_otus/L1/97/Root-k__Bacteria_otu_table_silva108_c80_97.txt  -s '*' -o ./rank_abundance_rela -f png
#plot_rank_abundance_graph.py -i split_otus/L1/97/Root-k__Bacteria_otu_table_silva108_c80_97.txt  -s '*' -o ./rank_abundance_abs -f png -a

#split_otu_table_by_taxonomy.py -i otu_table_silva108_c80_95.txt -o split_otus/L1/95 -L 2
#split_otu_table_by_taxonomy.py -i otu_table_silva108_c80_97.txt -o split_otus/L1/97 -L 2
#split_otu_table_by_taxonomy.py -i otu_table_silva108_c80_99.txt -o split_otus/L1/99 -L 2

#split_otu_table.py -i otu_table_silva108_c80_95.txt -o split_otus/95 -f SampleID -m map_1d.txt
#split_otu_table.py -i otu_table_silva108_c80_97.txt -o split_otus/97 -f SampleID -m map_1d.txt
#split_otu_table.py -i otu_table_silva108_c80_99.txt -o split_otus/99 -f SampleID -m map_1d.txt

# summarise 95%
#summarize_taxa_through_plots.py -i split_otus/L1/95/Root-k__Bacteria_otu_table_silva108_c80_95.txt -o taxa_summary_silva108_c80/95/bacteria -m map_1d.txt -c SampleID -p sum_taxat_paras.txt
#summarize_taxa_through_plots.py -i split_otus/L1/95/Root-k__Archaea_otu_table_silva108_c80_95.txt -o taxa_summary_silva108_c80/95/archaea -m map_1d.txt -c SampleID -p sum_taxat_paras.txt

# summarise 97%
#summarize_taxa_through_plots.py -i split_otus/L1/97/Root-k__Bacteria_otu_table_silva108_c80_97.txt -o taxa_summary_silva108_c80/97/bacteria -m map_1d.txt -c SampleID -p sum_taxat_paras.txt
#summarize_taxa_through_plots.py -i split_otus/L1/97/Root-k__Archaea_otu_table_silva108_c80_97.txt -o taxa_summary_silva108_c80/97/archaea -m map_1d.txt -c SampleID -p sum_taxat_paras.txt

#summarize_taxa_through_plots.py -i otu_table_gg_c50_97.txt -o taxa_summary_gg/97_absulte_abundance_c50/ -m map_1d_factors.txt -c SampleID -p sum_taxat_paras.txt
#summarize_taxa_through_plots.py -i otu_table_gg_c80_97.txt -o taxa_summary_gg/97_relative_abundance/ -m map_1d_factors.txt -c SampleID -p sum_taxat_paras.txt

#summarize_taxa_through_plots.py -i otu_table_silva108_c80_97.txt -o taxa_summary_silva108/97_absulte_abundance/ -m map_1d_factors.txt -c SampleID -p sum_taxat_paras.txt
#summarize_taxa_through_plots.py -i otu_table_silva108_c80_97.txt -o taxa_summary_silva108/97_relative_abundance/ -m map_1d_factors.txt -c SampleID -p sum_taxat_paras.txt
# summarise 99%
#summarize_taxa_through_plots.py -i split_otus/L1/99/Root-k__Bacteria_otu_table_silva108_c80_99.txt -o taxa_summary_silva108_c80/99/bacteria -m map_1d.txt -c SampleID -p sum_taxat_paras.txt
#summarize_taxa_through_plots.py -i split_otus/L1/99/Root-k__Archaea_otu_table_silva108_c80_99.txt -o taxa_summary_silva108_c80/99/archaea -m map_1d.txt -c SampleID -p sum_taxat_paras.txt


#make_otu_table.py -i uclust_picked_otus/uclust_95_picked_otus/denoised_seqs_otus.txt -t rdp_taxonomy/rdp_gg_c80/denoised_seqs_otu_rep_set_95_tax_assignments.txt -o otu_table_gg_c80_95.txt -e chimeras/95/chimeric_seqs_95.txt
#make_otu_table.py -i uclust_picked_otus/uclust_97_picked_otus/denoised_seqs_otus.txt -t rdp_taxonomy/rdp_gg_97_c50/denoised_seqs_otu_rep_set_97_tax_assignments.txt -o otu_table_gg_c50_97.txt -e chimeras/97/chimeric_seqs_97.txt
#make_otu_table.py -i uclust_picked_otus/uclust_99_picked_otus/denoised_seqs_otus.txt -t rdp_taxonomy/rdp_gg_c80/denoised_seqs_otu_rep_set_99_tax_assignments.txt -o otu_table_gg_c80_99.txt -e chimeras/99/chimeric_seqs_99.txt

#silva108
#assign_taxonomy.py -i denoised_seqs_otu_rep_set_95.fasta -o ./rdp_silva108_95_c80 -c 0.80 -t /home/salim/packages/Silva/Silva_108/taxa_mapping/Silva_RDP_taxa_mapping_genus.txt -r /home/salim/packages/Silva/Silva_108/rep_set/Silva_108_rep_set.fna
#assign_taxonomy.py -i denoised_seqs_otu_rep_set_97.fasta -o ./rdp_silva108_97_c80 -c 0.80 -t /home/salim/packages/Silva/Silva_108/taxa_mapping/Silva_RDP_taxa_mapping_genus.txt -r /home/salim/packages/Silva/Silva_108/rep_set/Silva_108_rep_set.fna
#assign_taxonomy.py -i denoised_seqs_otu_rep_set_99.fasta -o ./rdp_silva108_99_c80 -c 0.80 -t /home/salim/packages/Silva/Silva_108/taxa_mapping/Silva_RDP_taxa_mapping_genus.txt -r /home/salim/packages/Silva/Silva_108/rep_set/Silva_108_rep_set.fna

#greenegnes
#assign_taxonomy.py -i denoised_seqs_otu_rep_set_95.fasta -o ./rdp_gg_97_c80 -c 0.80
#assign_taxonomy.py -i denoised_seqs_otu_rep_set_97.fasta -o ./rdp_gg_97_c50 -c 0.50
#assign_taxonomy.py -i denoised_seqs_otu_rep_set_99.fasta -o ./rdp_gg_97_c80 -c 0.80

#make_phylogeny.py -i muscle_aligned/95/denoised_seqs_otu_rep_set_95_aligned.fasta -o ./denoised_seqs_rep_set_muscle_95_aligned.tre
#make_phylogeny.py -i muscle_aligned/97/denoised_seqs_otu_rep_set_97_aligned.fasta -o ./denobeta_diversity_through_plots.py -i ./otu_table_97.txt -m ./map_1d.txt -e 20337 -o ./wf_bdiv_even20337/ -t denoised_seqs_otu_rep_set_97_aligned_pfiltered.tre -a -O 8 --suppress_distance_histogramsised_seqs_rep_set_muscle_97_aligned.tre
#make_phylogeny.py -i muscle_aligned/99/denoised_seqs_otu_rep_set_99_aligned.fasta -o ./denoised_seqs_rep_set_muscle_99_aligned.tre


#beta_diversity_through_plots.py -i split_otus/L1/97/Root-k__Bacteria_otu_table_silva108_c80_97.txt -m map_1d_factors.txt -o ./beta_div/97/bacteria -t denoised_seqs_rep_set_muscle_97_aligned.tre -p alpha_paramters_bacteria.txt --color_by_all_fields -a -O 16

#beta_diversity_through_plots.py -i split_otus/L1/97/Root-k__Archaea_otu_table_silva108_c80_97.txt -m ./map_1d_factors.txt -e 360 -o ./bdiv_archaea_97_silva108_C80_even360/ -t denoised_seqs_rep_set_muscle_97_aligned.tre -a -O 8  -p alpha_paramters.txt

#alpha_rarefaction.py -i otu_table_silva108_c80_95.txt -m map_1d.txt -o alpha_rare_silva108_c80_95 -p alpha_paramters.txt -t denoised_seqs_rep_set_muscle_95_aligned.tre -a -O 24
# alpha div for archaea & bacteria
#alpha_rarefaction.py -i split_otus/L1/97/Root-k__Archaea_otu_table_silva108_c80_97.txt -m map_1d_factors.txt -o alpha_rare_silva108_c80_97/archaea -p alpha_paramters_archaea.txt -t denoised_seqs_rep_set_muscle_97_aligned.tre -a -O 24

#alpha_rarefaction.py -i split_otus/L1/97/Root-k__Bacteria_otu_table_silva108_c80_97.txt -m map_1d_factors.txt -o alpha_rare_silva108_c80_97/bacteria -p alpha_paramters_archaea.txt -t denoised_seqs_rep_set_muscle_97_aligned.tre -a -O 24

#alpha_rarefaction.py -i otu_table_silva108_c80_99.txt -m map_1d.txt -o alpha_rare_silva108_c80_99 -p alpha_paramters.txt -t denoised_seqs_rep_set_muscle_99_aligned.tre -a -O 24


#summarize_taxa_through_plots.py -i otu_table_97.txt -o wf_taxa_summary/97 -m map_1d.txt

#make_otu_network.py -m map_1d.txt -i otu_table_97.txt -o otu_network/97/

#make_otu_heatmap_html.py -i otu_table_97.txt -o ./otu_Heatmap_html/

#filter_alignment.py -i ./pynast_aligned/97/denoised_seqs_otu_rep_set_97_aligned.fasta -m /home/salim/packages/lanemask_in_1s_and_0s 

#identify_chimeric_seqs.py -i /home/salim/red_sea/cruise_2010/16S_pyrosequencing/pynast_aligned/99/denoised_seqs_otu_rep_set_99_aligned.fasta -a /home/salim/packages/core_set_aligned.fasta.imputed -m ChimeraSlayer -o chimeric_seqs_99.txt 


#align_seqs.py -i denoised_seqs_otu_rep_set_99.fasta -m muscle -o ./muscle_aligned/99

# Pick a representative otu set
#pick_rep_set.py -i uclust_95_picked_otus/denoised_seqs_otus.txt -f denoised_seqs/denoised_seqs.fna -o denoised_seqs_otu_rep_set_95.fasta
#pick_rep_set.py -i uclust_97_picked_otus/denoised_seqs_otus.txt -f denoised_seqs/denoised_seqs.fna -o denoised_seqs_otu_rep_set_97.fasta
#pick_rep_set.py -i uclust_99_picked_otus/denoised_seqs_otus.txt -f denoised_seqs/denoised_seqs.fna -o denoised_seqs_otu_rep_set_99.fasta

#pick_otus.py -i denoised_seqs/denoised_seqs.fna -c average -s 0.95 -A -o uclust_95_picked_otus
#pick_otus.py -i denoised_seqs/denoised_seqs.fna -c average -s 0.97 -A -o uclust_97_picked_otus
#pick_otus.py -i denoised_seqs/denoised_seqs.fna -c average -s 0.99 -A -o uclust_99_picked_otus

#inflate_denoiser_output.py -c 1d/centroids.fasta,2d/centroids_rc.fasta -s 1d/singletons.fasta,2d/singletons_rc.fasta -f ../split_lib_1d/seqs.fna,../split_lib_2d/seqs_rc.fna -d 1d/denoiser_mapping.txt,2d/denoiser_mapping.txt -o ./denoised_seqs.fna

#adjust_seq_orientation.py -i seqs.fna -r
#adjust_seq_orientation.py -i singletons.fasta -r

#denoise_wrapper.py -i sff/GG7OGXE01.txt -f split_lib_2d/seqs.fna -o ./denoised_seqs/2d/. -n 8 --force_overwrite -m map_2d.txt --titanium
#split_libraries.py -m map_2d.txt -f sff/GG7OGXE01.fna -q sff/GG7OGXE01.qual -l 150 -k -M 4 -b 6 -o ./split_lib_2d/. -e 2 -w 50 -n 100000

#denoiser.py -v -i data/F7SUHGS01.txt -f split_library_output_2d/seqs.fna -o denoised_2d_resume/ -p denoised_2d/ --checkpoint_fp=/home/onon/Project_Biofilm/denoised_2d/checkpoints/checkpoint50.pickle -c -n 24 --titanium
