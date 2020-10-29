#!/usr/bin/env python3

import os
import time
import sys
import pandas as pd

lista=pd.read_csv('gmail.csv')

for label, row in lista.iterrows():
    print(label + " : " + row["email"])
        
