all:
	@echo "make producton|test"

production:
	rm -rf public/
	hugo
	s3cmd --acl-public --delete-removed --no-progress sync public/* s3://carolinarscm.org

test:
	rm -rf public/
	hugo -b https://test.carolinarscm.org
	s3cmd --acl-public --delete-removed --no-progress sync public/* s3://test.carolinarscm.org
