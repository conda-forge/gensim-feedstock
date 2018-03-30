import sys
from subprocess import call
paths=sys.path
locations=[]
print(paths)
for path in paths:
	if 'site-packages' in path :
		locations.append(path)
for locatn in locations:
	print("Doing for ",locatn)		
	call(['py.test',locatn+'/gensim/test/test_word2vec.py','--profile-svg'])