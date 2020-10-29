#!/usr/bin/env python3

import os
import time
import sys
import pandas as pd

lista=pd.read_csv('gmail.csv')

for i in range(len(lista)):
    Class = lista.iloc[i,1]
    print (Class)
        
