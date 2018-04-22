import cProfile
from gensim.test.test_word2vec import *
import sys
cProfile.run("unittest.main()","combined-"+str(sys.version_info[0])+"."+str(sys.version_info[1]))