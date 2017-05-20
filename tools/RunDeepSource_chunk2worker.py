"""This application will generate commands for preparing
the data staging area for the RunDeepSource catalog. This area will
be used by the catalog loading tools.
"""

import sys
import os
import glob

if len(sys.argv) != 2:
    print "usage: {mkdir|ln}"
    sys.exit(1)

mode = sys.argv[1]
if mode not in ["mkdir","ln"]:
    print "usage: {mkdir|ln}"
    sys.exit(1)


inobjdir='/datasets/gapon/catalogs_01_partitioned/RunDeepSource'
outbase = "/datasets/gapon/production/stripe82_01_catalog_load/production_load/RunDeepSource"

workers = {}
for w in glob.glob("worker2chunks/*"):
    chunks = []
    with open(w,"r") as f:
        for chunk in f:
            chunks.append(int(chunk))
    node = w[len("worker2chunks/"):]
    workers[node] = chunks

for node in sorted(workers.keys()):

    if mode == "mkdir":
        print                            "mkdir -p {0}/{1}/".format(                 outbase, node)
    elif mode == "ln":
        print     "ln -s {0}/chunk_index.bin       {1}/{2}/".format(inobjdir,        outbase, node)
        for chunk in sorted(workers[node]):
            print "ln -s {0}/chunk_{1}.txt         {2}/{3}/".format(inobjdir, chunk, outbase, node)
            print "ln -s {0}/chunk_{1}_overlap.txt {2}/{3}/".format(inobjdir, chunk, outbase, node)
    else:
        sys.exit(1)

