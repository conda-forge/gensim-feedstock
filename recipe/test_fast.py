import logging
import unittest
from gensim.models import doc2vec

class TestFastVersion(unittest.TestCase):
	def testvesion(self):
		"""Tests fast version"""
		print("FAST VERSION value is ",doc2vec.FAST_VERSION) 	
		self.assertTrue(doc2vec.FAST_VERSION!=-1)

if __name__ == '__main__':
    logging.basicConfig(format='%(asctime)s : %(levelname)s : %(message)s', level=logging.DEBUG)
    unittest.main()
