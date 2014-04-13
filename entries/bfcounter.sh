# shell/Makefile to run benchmark for Kmerthon, BFCounter
# for demonstration, need to be updated
#




BFCount: BF_count_1.time BF_count_2.time BF_count_3.time BF_count_4.time BF_count_5.time BF_dump_1.time BF_dump_2.time BF_dump_3.time BF_dump_4.time BF_dump_5.time

BF_count_1.time:
	time -o BF_count_1.time BFCounter count -k 22 -n 600000000 -t 8 -c 100000 -o iowa.1 iowa_prairie_0920.fa.1

BF_dump_1.time:
	time -o BF_dump_1.time BFCounter dump -k 22 -i iowa.1 -o iowa.1.txt

BF_count_2.time:
	time -o BF_count_2.time BFCounter count -k 22 -n 1200000000 -t 8 -c 100000 -o iowa.2 iowa_prairie_0920.fa.2

BF_dump_2.time:
	time -o BF_dump_2.time BFCounter dump -k 22 -i iowa.2 -o iowa.2.txt

BF_count_3.time:
	time -o BF_count_3.time BFCounter count -k 22 -n 1500000000 -t 8 -c 100000 -o iowa.3 iowa_prairie_0920.fa.3

BF_dump_3.time:
	time -o BF_dump_3.time BFCounter dump -k 22 -i iowa.3 -o iowa.3.txt

BF_count_4.time:
	time -o BF_count_4.time BFCounter count -k 22 -n 1800000000 -t 8 -c 100000 -o iowa.4 iowa_prairie_0920.fa.4

BF_dump_4.time:
	time -o BF_dump_4.time BFCounter dump -k 22 -i iowa.4 -o iowa.4.txt

BF_count_5.time:
	time -o BF_count_5.time BFCounter count -k 22 -n 2200000000 -t 8 -c 100000 -o iowa.5 iowa_prairie_0920.fa.5

BF_dump_5.time:
	time -o BF_dump_5.time BFCounter dump -k 22 -i iowa.5 -o iowa.5.txt
