# You can override the hugo binary used to build the site by setting the
# HUGO environment variable in your shell.  This sets up the default.
HUGO?=hugo-0.15

all:
	@echo "make producton|test"

server:
	$(HUGO) server -w

production:
	rm -rf public/
	$(HUGO)
	gsutil -m rsync -d -r -c public/ gs://carolinarscm.org/

test:
	rm -rf public/
	$(HUGO) -b https://test.carolinarscm.org
	gsutil -m rsync -d -r -c public/ gs://test.carolinarscm.org/
