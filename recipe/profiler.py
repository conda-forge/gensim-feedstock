import cProfile
from gensim.test.test_word2vec import *
import sys
try:
	os.environ["OPENBLAS_NUM_THREADS"] = "1"
except Exception as e:
	print(e)
cProfile.run("unittest.main()","combined-"+str(sys.version_info[0])+"."+str(sys.version_info[1]))