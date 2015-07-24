deploy:
	rm -rf public/
	hugo
	s3cmd --acl-public --delete-removed --no-progress sync public/* s3://carolinarscm.org
