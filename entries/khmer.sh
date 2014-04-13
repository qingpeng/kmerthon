# shell/Makefile to run benchmark for Kmerthon, Khmer
# for demonstration, need to be updated
#


# khmer benchmark
#khmer_benchmark: $(BLOOM_HIST) $(BLOOM_COUNT)

khmer_benchmark: bloom_1_1_22.hist bloom_2_1_22.hist bloom_3_1_22.hist bloom_4_1_22.hist bloom_5_1_22.hist \
	bloom_1_5_22.hist bloom_2_5_22.hist bloom_3_5_22.hist bloom_4_5_22.hist bloom_5_5_22.hist \
	bloom_1_20_22.hist bloom_2_20_22.hist bloom_3_20_22.hist bloom_4_20_22.hist bloom_5_20_22.hist \
	bloom_1_1_22.count.time bloom_2_1_22.count.time bloom_3_1_22.count.time bloom_4_1_22.count.time \
	bloom_5_1_22.count.time


# error rate = 0.01
bloom_1_1_22.hist bloom_1_1_22.kh: HASH =  --threads 8 -k 22 -N 6 -x 896487446
bloom_2_1_22.hist bloom_2_1_22.kh:: HASH =  --threads 8 -k 22 -N 6 -x 1693926061
bloom_3_1_22.hist bloom_3_1_22.kh:: HASH =  --threads 8 -k 22 -N 6 -x 2309876682
bloom_4_1_22.hist bloom_4_1_22.kh:: HASH =  --threads 8 -k 22 -N 6 -x 2828533499
bloom_5_1_22.hist bloom_5_1_22.kh:: HASH =  --threads 8 -k 22 -N 6 -x 3389075734

# error rate = 0.05
bloom_1_5_22.hist: HASH =  --threads 8 -k 22 -N 4 -x 874767793
bloom_2_5_22.hist: HASH =  --threads 8 -k 22 -N 4 -x 1652886462
bloom_3_5_22.hist: HASH =  --threads 8 -k 22 -N 4 -x 2253914137
bloom_4_5_22.hist: HASH =  --threads 8 -k 22 -N 4 -x 2760005195
bloom_5_5_22.hist: HASH =  --threads 8 -k 22 -N 4 -x 3306966891

# error rate = 0.20

bloom_1_20_22.hist: HASH =  --threads 8 -k 22 -N 2 -x 939926751
bloom_2_20_22.hist: HASH =  --threads 8 -k 22 -N 2 -x 1776005260
bloom_3_20_22.hist: HASH =  --threads 8 -k 22 -N 2 -x 2421801771
bloom_4_20_22.hist: HASH =  --threads 8 -k 22 -N 2 -x 2965590108
bloom_5_20_22.hist: HASH =  --threads 8 -k 22 -N 2 -x 3553293421


BLOOM_HIST = bloom_1_1_22.hist bloom_2_1_22.hist bloom_3_1_22.hist bloom_4_1_22.hist bloom_5_1_22.hist \
	bloom_1_5_22.hist bloom_2_5_22.hist bloom_3_5_22.hist bloom_4_5_22.hist bloom_5_5_22.hist \
	bloom_1_20_22.hist bloom_2_20_22.hist bloom_3_20_22.hist bloom_4_20_22.hist bloom_5_20_22.hist


bloom_%_1_22.hist: iowa_prairie_0920.fa.%
	-echo 3 > /proc/sys/vm/drop_caches
	time -o $@.time ${KHMER}/scripts/abundance-dist-single.py -s $(HASH) $^ $@


bloom_%_5_22.hist: iowa_prairie_0920.fa.%
	-echo 3 > /proc/sys/vm/drop_caches
	time -o $@.time ${KHMER}/scripts/abundance-dist-single.py -s $(HASH) $^ $@


bloom_%_20_22.hist: iowa_prairie_0920.fa.%
	-echo 3 > /proc/sys/vm/drop_caches
	time -o $@.time ${KHMER}/scripts/abundance-dist-single.py -s $(HASH) $^ $@


BLOOM_COUNT = bloom_1_1_22.count.time bloom_2_1_22.count.time bloom_3_1_22.count.time bloom_4_1_22.count.time \
	bloom_5_1_22.count.time

bloom_%_1_22.kh: iowa_prairie_0920.fa.%
	-echo 3 > /proc/sys/vm/drop_caches
	time -o $@.time ${KHMER}/scripts/load-into-counting.py  $(HASH) $@ $<

%.count.time: %.kh kmerlist2
	-echo 3 > /proc/sys/vm/drop_caches
	time -o $@ python khmer-count-kmers.py $^
