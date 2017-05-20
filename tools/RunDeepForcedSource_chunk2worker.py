"""This application will generate commands for preparing
the data staging area for the RunDeepiForcedSource catalog. This area will
be used by the catalog loading tools.
"""

import sys
import os, os.path
import glob

if len(sys.argv) != 2:
    print "usage: {mkdir|ln}"
    sys.exit(1)

mode = sys.argv[1]
if mode not in ["mkdir","ln"]:
    print "usage: {mkdir|ln}"
    sys.exit(1)

inDirBase  = "/datasets/gapon/catalogs_01_partitioned/RunDeepForcedSource"
outDirBase = "/datasets/gapon/production/stripe82_01_catalog_load/production_load/RunDeepForcedSource"

folders_ncsa  = ["daues_SDRP_dedupe_byfilter_%s" % band for band in ["0","1","2","3","4"]]
folders_in2p3 = ["lsst_prod_dedupe_byfilter_%s"  % band for band in ["u","g","r","i","z"]]

folders = folders_ncsa + folders_in2p3

workers = {}
for w in glob.glob("worker2chunks/*"):
    chunks = []
    with open(w,"r") as f:
        for chunk in f:
            chunks.append(int(chunk))
    node = w[len("worker2chunks/"):]
    workers[node] = chunks

for node in sorted(workers.keys()):

    for folder in folders:
        inDir  = "{0}/{1}"        .format( inDirBase,       folder)
        outDir = "{0}/{1}/out_{2}".format(outDirBase, node, folder)
        if mode == "mkdir":
            print  "mkdir -p {0}".format(outDir)
        elif mode == "ln":
            print     "ln -s {0}/chunk_index.bin {1}/".format(inDir, outDir)
            for chunk in sorted(workers[node]):
                inFilePath = "{0}/chunk_{1}.txt".format(inDir, chunk)
                if os.path.exists(inFilePath):
                    print "ln -s {0} {1}/".format(inFilePath, outDir)
        else:
            sys.exit(1)

