#!/usr/bin/env python

import pandas as pd

full = pd.read_csv("description", header=None, sep='\t')
full.columns = ["id", "desc"]

sub = pd.read_csv("list", header=None, sep="\t")
sub.columns = ["id"]

merged = sub.merge(full, on="id")
merged.to_csv("merged", header=None, index=None, sep='\t')
