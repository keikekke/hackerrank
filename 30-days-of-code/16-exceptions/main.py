# Because the server does not accept Go in this problem,
# I chose Python instead.

#!/bin/python3

import math
import os
import random
import re
import sys


S = input()
try:
    print(int(S))
except:
    print('Bad String')
