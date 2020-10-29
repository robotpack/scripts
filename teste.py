#!/usr/bin/env python3

import os
import time
import sys
import pandas as pd

lista=pd.read_csv('gmail.csv' , delimiter=';')

lista.head()

for label, row in lista.iterrows():
    print(row['email'] + ' ' + row['senha'] )

        
