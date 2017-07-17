.DEFAULT_GOAL := test

.PHONY: RunCollatz.tmp
RunCollatz.tmp: 
	-pep8 home.py
	-pylint home.py
	-mypy home.py

clean:
	rm -f  *.pyc
	rm -f  RunCollatz.tmp
	rm -rf __pycache__

test: RunCollatz.tmp
	ls -al
	make clean

