.PHONY: watch test

open:
	subl --project timestring.sublime-project

deploy: tag upload

tag:
	git tag -a v$(shell python -c "import timestring;print(timestring.version);") -m ""
	git push origin v$(shell python -c "import timestring;print(timestring.version);")

upload:
	python setup.py sdist upload

compare:
	hub compare $(shell git tag | tail -1)...master

test:
	. venv/bin/activate; pip uninstall -y timestring-pleasantone
	. venv/bin/activate; python setup.py install
	. venv/bin/activate; nosetests --rednose --with-cov --cov-config=.coveragerc

test3:
	. venv/bin/activate; pip3 uninstall -y timestring-pleasantone
	. venv/bin/activate; python3 setup.py install test

venv:
	virtualenv venv
	. venv/bin/activate; python setup.py install

venv3:
	venv venv
	. venv/bin/activate; python3 setup.py install

watch:
	watchr Watch
